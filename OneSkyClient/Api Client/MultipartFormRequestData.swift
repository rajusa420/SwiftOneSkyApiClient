//
//  MultipartFormRequestData.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/1/22.
//

import Foundation

public enum MultipartForRequestMimeType: String {
    case octetStream = "application/octet-stream"
}

public struct MultipartFormRequestData {
    let name = "file"
    let filename: String
    let mimeType: MultipartForRequestMimeType
    let data: Data?
    let boundary = UUID().uuidString
    
    public func getHttpBody() -> Data? {
        guard let data = data else {
            return nil
        }
        
        var httpBody = Data()
        httpBody.append("--\(boundary)\r\n")
        httpBody.append("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n")
        httpBody.append("Content-Type: \(mimeType.rawValue)\r\n")
        httpBody.append("\r\n")
        httpBody.append(data)
        httpBody.append("\r\n")
        httpBody.append("--\(boundary)--")
        return httpBody
    }
}
