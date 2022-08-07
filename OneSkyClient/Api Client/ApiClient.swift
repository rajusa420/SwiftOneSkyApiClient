//
//  ApiClient.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation

struct EmptyRequestBody: Codable {}

struct EmptyResponseBody: Codable {}

class ApiClient {
    var baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func buildRequest(
        _ path: String,
        _ requestMethod: APIRequestMethod,
        body: Data? = nil,
        queryItems: [URLQueryItem]? = nil,
        contentType: ContentType = .applicationJson
    ) async throws -> URLRequest {
        try await APIRequestBuilder(method: requestMethod, baseUrl: baseURL, path: path)
            .addQueryParams(queryItems)
            .addHeaderField(.contentType, contentType: contentType)
            .addHeaderField(.acceptType, contentType: .applicationJson)
            .addBody(body)
            .build()
    }
    
    func buildRequest(
        _ path: String,
        _ requestMethod: APIRequestMethod,
        formData: MultipartFormRequestData,
        queryItems: [URLQueryItem]? = nil,
        contentType: ContentType = .multipartFormData
    ) async throws -> URLRequest {
        try await APIRequestBuilder(method: requestMethod, baseUrl: baseURL, path: path)
            .addQueryParams(queryItems)
            .addHeaderField(.contentType, contentType: contentType, boundary: formData.boundary)
            .addHeaderField(.acceptType, contentType: .applicationJson)
            .addFormData(formData)
            .build()
    }
    
    func get<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        let (_, data) = try await getData(path, queryItems: queryItems)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func getData(_ path: String, queryItems: [URLQueryItem]? = nil) async throws -> (Int, Data) {
        let request = try await buildRequest(path, .get, queryItems: queryItems)
        return try await executeRequest(request)
    }
    
    func put<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        let encodedBody = try await encodeBody(body)
        let request = try await buildRequest(path, .put, body: encodedBody, queryItems: queryItems)
        let (_, data) = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func post<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]?, contentType: ContentType = .applicationJson) async throws -> ResponseBodyType {
        let encodedBody = try await encodeBody(body)
        let request = try await buildRequest(path, .post, body: encodedBody, queryItems: queryItems, contentType: contentType)
        let (_, data) = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func post<ResponseBodyType: Decodable>(
        _ path: String,
        multipartFormRequestData: MultipartFormRequestData,
        queryItems: [URLQueryItem]?
    ) async throws -> ResponseBodyType {
        let request = try await buildRequest(path, .post, formData: multipartFormRequestData, queryItems: queryItems)
        let (_, data) = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func delete<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]?) async throws -> ResponseBodyType {
        let request = try await buildRequest(path, .delete, queryItems: queryItems)
        let (_, data) = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    private func encodeBody<Type: Codable>(_ body: Type?) async throws -> Data? {
        let encodedData: Data? = try await withCheckedThrowingContinuation { continuation in
            guard let body = body else {
                continuation.resume(returning: nil)
                return
            }
            
            do {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .iso8601
                let data = try encoder.encode(body)
                continuation.resume(returning: data)
            } catch {
                continuation.resume(throwing: APIError.encodingError(message: error.localizedDescription))
            }
        }
        
        return encodedData
    }
    
    func decodeResponse<ResponseType: Decodable>(data: Data) async throws -> ResponseType {
        let response: ResponseType = try await withCheckedThrowingContinuation { continuation in
            do {
                if data.count <= 0,
                   let response = EmptyResponseBody() as? ResponseType {
                    continuation.resume(returning: response)
                } else {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601

                    let decodedResponse = try jsonDecoder.decode(ResponseType.self, from: data)
                    continuation.resume(returning: decodedResponse)
                }
            } catch {
                continuation.resume(throwing: APIError.decodingError(message: error.localizedDescription))
            }
        }
        
        return response
    }
    
    func handleResponse(data: Data, httpResponse: HTTPURLResponse) async throws -> (Int, Data) {
        let statusCode = httpResponse.statusCode
        switch statusCode {
            case 200 ..< 300:
                return (statusCode, data)
    
            case 401:
                throw APIError.needsAuthentication(message: String(format: NSLocalizedString("User required authentication: %d", comment: ""), httpResponse.statusCode))
            
            case 403:
                throw APIError.unauthorized(message: String(format: NSLocalizedString("User not authorized for this request: %d", comment: ""), httpResponse.statusCode))
            
            default:
                throw APIError.generic(message: String(format: NSLocalizedString("Request failed (code:  %d). %@", comment: ""), httpResponse.statusCode, httpResponse.description))
        }
    }
    
    private func executeRequest(_ urlRequest: URLRequest) async throws -> (Int, Data) {
        print("Execute Request: \(urlRequest.url?.absoluteString ?? "n/a")")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.generic(message: NSLocalizedString("Invalid response received for API Request", comment: ""))
        }
        
        return try await handleResponse(data: data, httpResponse: httpResponse)
    }
}
