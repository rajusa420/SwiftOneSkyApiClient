//
//  OneSkyApiService.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

// TODO: For now this is maintaining the lifetime of the api client. Need to decide if I want to keep it around
class OneSkyApiService {
    static let instance = OneSkyApiService()
    lazy var apiClient = OneSkyApiClient(baseURL: OneSkyUrls.basePath)
    
    static func get<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        return try await instance.apiClient.get(path, queryItems: queryItems)
    }
    
    static func put<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]? = nil) async throws -> ResponseBodyType {
        return try await instance.apiClient.put(path, body: body, queryItems: queryItems)
    }
    
    static func post<RequestBodyType: Codable, ResponseBodyType: Decodable>(_ path: String, body: RequestBodyType?, queryItems: [URLQueryItem]?, contentType: ContentType = .applicationJson) async throws -> ResponseBodyType {
        return try await instance.apiClient.post(path, body: body, queryItems: queryItems, contentType: contentType)
    }
    
    static func post<ResponseBodyType: Decodable>(
        _ path: String,
        multipartFormRequestData: MultipartFormRequestData,
        queryItems: [URLQueryItem]?
    ) async throws -> ResponseBodyType {
        return try await instance.apiClient.post(
            path,
            multipartFormRequestData: multipartFormRequestData,
            queryItems: queryItems
        )
    }
    
    static func delete<ResponseBodyType: Decodable>(_ path: String, queryItems: [URLQueryItem]?) async throws -> ResponseBodyType {
        return try await instance.apiClient.delete(path, queryItems: queryItems)
    }
}
