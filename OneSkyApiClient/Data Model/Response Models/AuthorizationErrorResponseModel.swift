//
//  AuthorizationErrorResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct AuthorizationErrorDataModel: Codable {
    let data: [String: String]?
}

struct AuthorizationErrorResponseModel: Codable {
    let meta: AuthorizationErrorMetaModel
    let data: AuthorizationErrorDataModel
    
    var status: Int {
        meta.status
    }
    
    var message: String {
        meta.message ?? "No error message in response"
    }
}
