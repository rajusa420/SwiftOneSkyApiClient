//
//  SecretKeyManager.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation

public enum SecretKeyName: String, CaseIterable {
    case oneSkyKey = "onesky_key"
    case oneSkySecret = "onesky_secret"
}

class SecretKeysManager {
    public static let instance = SecretKeysManager()
    private var secretsDictionary: [String: String] = [:]
    
    private init() {
        loadSecretsPlist()
    }
    
    private func loadSecretsPlist() {
        guard case let frameworkBundle = Bundle(for: SecretKeysManager.self),
              let secretKeysPath = frameworkBundle.path(forResource: "apikeys", ofType: "plist"),
              let loadedSecretsDictionary = NSDictionary(contentsOfFile: secretKeysPath) else {
            fatalError("Unable to load api keys plist! Please ensure you have created an apikeys.plist file in the root of the project that contains the one sky api client key")
        }
        
        guard loadedSecretsDictionary.count > 0 else {
            fatalError("Api keys file contains no key/value pairs!")
        }
        
        // Convert the NSDictionary to a swift Dictionary
        loadedSecretsDictionary.allKeys.forEach { key in
            if let keyString = key as? String,
               let value = loadedSecretsDictionary.value(forKey: keyString) as? String {
                secretsDictionary[keyString] = value
            }
        }
    }
    
    func getSecretKey(keyName: SecretKeyName) -> String? {
        let value = secretsDictionary[keyName.rawValue]
//        if let value = value {
//            AppLog.d("Returning Secret Key \(keyName.rawValue): \(value)")
//        } else {
//            AppLog.e("Failed to find key for \(keyName.rawValue)")
//        }
        
        return value
    }
    
    private func getSecretKey(keyName: String) -> String? {
        guard let key = SecretKeyName(rawValue: keyName) else {
            fatalError("Invalid key name passed to get secret key!")
        }
        
        return getSecretKey(keyName: key)
    }
}
