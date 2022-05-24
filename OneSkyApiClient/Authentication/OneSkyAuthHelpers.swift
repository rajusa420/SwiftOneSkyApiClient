//
//  OneSkyAuthHelpers.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class OneSkyAuthHelpers {
    static func getApiKey() -> String {
        guard let apiKey = SecretKeysManager.instance.getSecretKey(keyName: .oneSkyKey) else {
            fatalError("One sky api key not found! Please ensure the apikeys.plist file contains the key.")
        }
        
        return apiKey
    }
    
    private static func getUnixTimeStampInSeconds() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    private static func getApiSecret() -> String {
        guard let apiSecret = SecretKeysManager.instance.getSecretKey(keyName: .oneSkySecret) else {
            fatalError("One sky api secret not found! Please ensure the apikeys.plist file contains the secret.")
        }
        
        return apiSecret
    }
    
    static func getTimeStampAndDevHash() -> (String, String) {
        let apiSecret = Self.getApiSecret()
        let unixTimeStamp = String(Self.getUnixTimeStampInSeconds())
        let devHashString = apiSecret + unixTimeStamp
        return (unixTimeStamp, MD5Helper.MD5(string: devHashString))
    }
}
