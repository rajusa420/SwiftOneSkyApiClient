//
//  OneSkySecretKeyHelper.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

class OneSkySecretKeyHelper {
    static func getApiKey() throws -> String {
        guard let apiKey = try SecretKeysManager.instance.getSecretKey(keyName: .oneSkyPublicKey) else {
            fatalError("One sky api key not found! Please ensure the apikeys.plist file contains the key.")
        }
        
        return apiKey
    }
    
    static func getApiSecret() throws -> String {
        guard let apiSecret = try SecretKeysManager.instance.getSecretKey(keyName: .oneSkySecretKey) else {
            fatalError("One sky api secret not found! Please ensure the apikeys.plist file contains the secret.")
        }
        
        return apiSecret
    }
}
