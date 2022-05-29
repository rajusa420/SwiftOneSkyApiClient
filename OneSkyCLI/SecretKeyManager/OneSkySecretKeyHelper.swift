//
//  OneSkySecretKeyHelper.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

class OneSkySecretKeyHelper {
    static func getApiKey() -> String {
        guard let apiKey = SecretKeysManager.instance.getSecretKey(keyName: .oneSkyKey) else {
            fatalError("One sky api key not found! Please ensure the apikeys.plist file contains the key.")
        }
        
        return apiKey
    }
    
    static func getApiSecret() -> String {
        guard let apiSecret = SecretKeysManager.instance.getSecretKey(keyName: .oneSkySecret) else {
            fatalError("One sky api secret not found! Please ensure the apikeys.plist file contains the secret.")
        }
        
        return apiSecret
    }
}
