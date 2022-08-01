//
//  OneSkyApiClient.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation

class OneSkyApiClient: ApiClient {
    private enum AuthQueryItemName: String {
        case apiKey = "api_key"
        case timeStamp = "timestamp"
        case devHash = "dev_hash"
    }
    
    private func addAuthQueryParams(to queryItems: [URLQueryItem]?) -> [URLQueryItem] {
        var queryItems = queryItems ?? []
        queryItems.append(URLQueryItem(name: AuthQueryItemName.apiKey.rawValue, value: OneSkyClient.instance.getApiKey()))
        
        let (timeStamp, devHash) = OneSkyAuthHelpers.getTimeStampAndDevHash(apiSecret: OneSkyClient.instance.getApiSecret())
        queryItems.append(URLQueryItem(name: AuthQueryItemName.timeStamp.rawValue, value: timeStamp))
        queryItems.append(URLQueryItem(name: AuthQueryItemName.devHash.rawValue, value: devHash))
        return queryItems
    }
    
    override func get<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        return try await super.get(path, queryItems: addAuthQueryParams(to: queryItems))
    }
    
    override func put<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        return try await super.put(path, body: body, queryItems: addAuthQueryParams(to: queryItems))
    }
    
    override func post<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]?, contentType: ContentType = .applicationJson) async throws -> ResponseBodyType {
        return try await super.post(path, body: body, queryItems: addAuthQueryParams(to: queryItems), contentType: contentType)
    }
    
    override func post<ResponseBodyType: Decodable>(
        _ path: String,
        multipartFormRequestData: MultipartFormRequestData,
        queryItems: [URLQueryItem]?
    ) async throws -> ResponseBodyType {
        return try await super.post(
            path,
            multipartFormRequestData: multipartFormRequestData,
            queryItems: addAuthQueryParams(to: queryItems)
        )
    }
    
    override func delete<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]?) async throws -> ResponseBodyType {
        return try await super.delete(path, queryItems: addAuthQueryParams(to: queryItems))
    }
    
    override func handleResponse(data: Data, httpResponse: HTTPURLResponse) async throws -> Data {
        switch httpResponse.statusCode {
            case 200 ..< 300:
                return data
    
            case 401:
                let authErrorResponse: AuthorizationErrorResponseModel = try await decodeResponse(data: data)
                throw APIError.needsAuthentication(message: NSLocalizedString("User requires authentication: \(authErrorResponse.message)", comment: ""))
            
            case 403:
                throw APIError.unauthorized(message: NSLocalizedString("User not authorized for this request: \(httpResponse.statusCode)", comment: ""))
            
            default:
                throw APIError.generic(message: NSLocalizedString("Request failed (code: \(httpResponse.statusCode)). \(httpResponse.description)", comment: ""))
        }
    }
}
