//
//  AuthorizationErrorResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class AuthorizationErrorMetaModel: Codable {
    let status: Int
    let message: String?
}

class AuthorizationErrorDataModel: Codable {
    let data: [String: String]?
}

class AuthorizationErrorResponseModel: Codable {
    let meta: AuthorizationErrorMetaModel
    let data: AuthorizationErrorDataModel
    
    var status: Int {
        meta.status
    }
    
    var message: String {
        meta.message ?? "No error message in response"
    }
}
