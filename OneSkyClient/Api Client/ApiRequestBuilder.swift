//
//  ApiRequestBuilder.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

public enum APIHeaderField: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
    case contentLength = "Content-Length"
    case authorization = "Authorization"
}

public enum ContentType: String {
    case applicationJson = "application/json"
    case multipartFormData = "multipart/form-data"
}

extension URLRequest {
    public mutating func setValue(_ value: String?, forHTTPHeaderField field: APIHeaderField) {
        setValue(value, forHTTPHeaderField: field.rawValue)
    }
    
    public mutating func addValue(_ value: String, forHTTPHeaderField field: APIHeaderField) {
        addValue(value, forHTTPHeaderField: field.rawValue)
    }
}

class APIRequestBuilder {
    private let method: APIRequestMethod
    private let baseUrl: String
    private let path: String
    private var queryParams: [URLQueryItem] = []
    private var body: Data?
    private var authToken: String?
    private var headerFields: [APIHeaderField: String] = [:]
    private let timeOutInterval: TimeInterval = 30
    
    init(method: APIRequestMethod, baseUrl: String, path: String) {
        self.method = method
        self.baseUrl = baseUrl
        self.path = path
    }
    
    func addBody(_ body: Data?) -> APIRequestBuilder {
        if let body = body {
            self.body = body
        }
        
        return self
    }
    
    func addAuthToken(_ token: String?) -> APIRequestBuilder {
        if let token = token {
            self.authToken = token
        }
        return self
    }
    
    func addQueryParam(_ queryParam: URLQueryItem?) -> APIRequestBuilder {
        if let queryParam = queryParam {
            self.queryParams.append(queryParam)
        }
        return self
    }
    
    func addQueryParams(_ queryParams: [URLQueryItem]?) -> APIRequestBuilder {
        if let queryParams = queryParams {
            self.queryParams.append(contentsOf: queryParams)
        }
        
        return self
    }
    
    func addHeaderField(_ apiHeaderField: APIHeaderField, value: String) -> APIRequestBuilder {
        headerFields[apiHeaderField] = value
        return self
    }
    
    func addHeaderField(_ apiHeaderField: APIHeaderField, contentType: ContentType) -> APIRequestBuilder {
        headerFields[apiHeaderField] = contentType.rawValue
        return self
    }
    
    func build() async throws -> URLRequest {
        guard var url = URL(string: self.baseUrl) else {
            throw APIError.invalidBaseUrl(message: self.baseUrl)
        }
        
        url.appendPathComponent(path)
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw APIError.requestComponentsParseError(message: "Failed to parse url components.")
        }
        
        urlComponents.queryItems = queryParams
        guard let urlWithParams = urlComponents.url else {
            throw APIError.requestComponentsParseError(message: "Failed to construct url with query params.")
        }
        
        var request = URLRequest(url: urlWithParams)
        request.timeoutInterval = self.timeOutInterval
        request.httpMethod = self.method.rawValue
        
        if let body = body {
            request.httpBody = body
            request.addValue("\(body.count)", forHTTPHeaderField: .contentLength)
        }
        
        if let authToken = authToken {
            request.addValue("token \(authToken)", forHTTPHeaderField: .authorization)
        }
        
        return request
    }
}
