//
//  ApiError.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

public enum APIResult<Type> {
    case success(APIResponse<Type>)
    case failure(APIError)
}

public struct APIResponse<Type> {
    public let statusCode: Int
    public let body: Type
}

public enum APIError: Error {
    case invalidBaseUrl(message: String)
    case unauthorized(message: String)
    case needsAuthentication(message: String)
    case generic(message: String)
    case encodingError(message: String)
    case decodingError(message: String)
    case badRequest(message: String)
    case requestComponentsParseError(message: String)
    
    func getApiErrorMessage() -> String {
        switch self {
        case .invalidBaseUrl(let message):
            return "Invalid Base Url: \(message)"
        case .unauthorized(let message):
            return "User is Unauthorized: \(message)"
        case .needsAuthentication(let message):
            return "User requires authentication: \(message)"
        case .generic(let message):
            return "Api Error: \(message)"
        case .encodingError(let message):
            return "Error encoding body for API request: \(message)"
        case .decodingError(let message):
            return "Error decoding API response: \(message)"
        case .badRequest(let message):
            return "Bad request: \(message)"
        case .requestComponentsParseError(let message):
            return "Unable to parse request components: \(message)"
        }
    }
}

public enum APIRequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
