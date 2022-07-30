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
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .invalidBaseUrl(let message):
                return String(format: NSLocalizedString("Invalid Base Url: %@", comment: ""), message)
            case .unauthorized(let message):
                return String(format: NSLocalizedString("User is Unauthorized: %@", comment: ""), message)
            case .needsAuthentication(let message):
                return String(format: NSLocalizedString("User requires authentication: %@", comment: ""), message)
            case .generic(let message):
                return String(format: NSLocalizedString("Api Error: %@", comment: ""), message)
            case .encodingError(let message):
                return String(format: NSLocalizedString("Error encoding body for API request: %@", comment: ""), message)
            case .decodingError(let message):
                return String(format: NSLocalizedString("Error decoding API response: %@", comment: ""), message)
            case .badRequest(let message):
                return String(format: NSLocalizedString("Bad request: %@", comment: ""), message)
            case .requestComponentsParseError(let message):
                return String(format: NSLocalizedString("Unable to parse request components: %@", comment: ""), message)
        }
    }
}

public enum APIRequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
