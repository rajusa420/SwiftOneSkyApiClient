//
//  AuthorizationErrorMetaModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

struct AuthorizationErrorMetaModel: Codable {
    let status: Int
    let message: String?
}
