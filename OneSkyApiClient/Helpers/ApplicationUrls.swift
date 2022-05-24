//
//  ApplicationUrls.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class ApplicationUrlConstants {
    public static var urlProtocol: String {
        return "https://"
    }
    
    public static var domain: String {
        return "platform.api.onesky.io/1"
    }
}

class ApplicationUrls {
    public static var basePath: String {
        return "\(ApplicationUrlConstants.urlProtocol)\(ApplicationUrlConstants.domain)"
        
    }
    
    public static var projectGroupListPath: String = "project-groups"
}