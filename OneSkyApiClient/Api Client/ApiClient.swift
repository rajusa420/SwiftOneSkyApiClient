//
//  ApiClient.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation

class ApiClient {
    var baseURL: String
    
    var headerContentType: String {
        get {
            "application/json"
        }
    }
    
    var headerAcceptType: String {
        get {
            "application/json"
        }
    }
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func buildRequest(_ path: String, _ requestMethod: APIRequestMethod, body: Data? = nil, queryItems: [URLQueryItem]? = nil) async throws -> URLRequest {
        try await APIRequestBuilder(method: requestMethod, baseUrl: self.baseURL, path: path)
            .addQueryParams(queryItems)
            .addHeaderField(.contentType, value: self.headerContentType)
            .addHeaderField(.acceptType, value: self.headerAcceptType)
            .addBody(body)
            .build()
    }
    
    func get<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        let request = try await buildRequest(path, .get, queryItems: queryItems)
        let data = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func put<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        let encodedBody = try await encodeBody(body)
        let request = try await buildRequest(path, .put, body: encodedBody, queryItems: queryItems)
        let data = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData

    }
    
    func post<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]?) async throws -> ResponseBodyType {
        let encodedBody = try await encodeBody(body)
        let request = try await buildRequest(path, .post, body: encodedBody, queryItems: queryItems)
        let data = try await executeRequest(request)
        let decodedData: ResponseBodyType = try await decodeResponse(data: data)
        return decodedData
    }
    
    func delete<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]?) async throws -> ResponseBodyType {
        let request = try await buildRequest(path, .delete, queryItems: queryItems)
        let data = try await executeRequest(request)
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
            }
            catch {
                continuation.resume(throwing: APIError.encodingError(message: error.localizedDescription))
            }
        }
        
        return encodedData
    }
    
    func decodeResponse<ResponseType: Decodable>(data: Data) async throws -> ResponseType {
        let response: ResponseType = try await withCheckedThrowingContinuation { continuation in
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601

                let decodedResponse = try jsonDecoder.decode(ResponseType.self, from: data)
                continuation.resume(returning: decodedResponse)
            } catch {
                continuation.resume(throwing: APIError.decodingError(message: error.localizedDescription))
            }
        }
        
        return response
    }
    
    func handleResponse(data: Data, httpResponse: HTTPURLResponse) async throws -> Data {
        switch httpResponse.statusCode {
            case 200..<300:
                return data
    
            case 401:
                throw APIError.needsAuthentication(message: "User required authentication: \(httpResponse.statusCode)")
            
            case 403:
            throw APIError.unauthorized(message: "User not authorized for this request: \(httpResponse.statusCode)")
            
            default:
                throw APIError.generic(message: "Request failed (code: \(httpResponse.statusCode)). \(httpResponse.description)")
        }
    }
    
    private func executeRequest(_ urlRequest: URLRequest) async throws -> Data {
        print("Execute Request: \(urlRequest.url?.absoluteString ?? "n/a")")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.generic(message: "Invalid response received for API Request")
        }
        
        return try await handleResponse(data: data, httpResponse: httpResponse)
    }
}


