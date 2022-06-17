//
//  SecretKeyManager.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation


public enum SecretKeyManagerError: Error {
    case notInitialized
    case invalidKeyName(message: String)
    case failedToLoadSecretsFile(message: String)
    case invalidSecretsFile(message: String)
}

extension SecretKeyManagerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notInitialized:
            return "The client was not initialized with the api public and secret key."
        case .invalidKeyName(let message):
            return "Unexpected Error: \(message)"
        case .failedToLoadSecretsFile(let message),
             .invalidSecretsFile(let message):
            return "Error: \(message)"
        }
    }
}

public enum SecretKeyName: String, CaseIterable {
    case oneSkyPublicKey = "onesky_public_key"
    case oneSkySecretKey = "onesky_secret_key"
}

class SecretKeysManager {
    public static let instance = SecretKeysManager()
    private var secretsDictionary: [String: String] = [:]
    private var keysInitialized = false
    
    public func initialize(withSecretKeyFilePath secretKeyFilePath: String) throws {
        try loadSecretsPlist(secretKeysPath: secretKeyFilePath)
        keysInitialized = true
    }
    
    public func initialize(withPublicKey publicKey: String, secretKey: String) {
        secretsDictionary[SecretKeyName.oneSkyPublicKey.rawValue] = publicKey
        secretsDictionary[SecretKeyName.oneSkySecretKey.rawValue] = secretKey
        keysInitialized = true
    }
    
    private func loadSecretsPlist(secretKeysPath: String) throws {
        guard let loadedSecretsDictionary = NSDictionary(contentsOfFile: secretKeysPath) else {
            throw SecretKeyManagerError.failedToLoadSecretsFile(message: "Unable to load api keys plist! Please ensure you have created an apikeys.plist file in the root of the project that contains the one sky api client key")
        }
        
        guard loadedSecretsDictionary.count > 0 else {
            throw SecretKeyManagerError.invalidSecretsFile(message: "Api keys file contains no key/value pairs!")
        }
        
        // Convert the NSDictionary to a swift Dictionary
        loadedSecretsDictionary.allKeys.forEach { key in
            if let keyString = key as? String,
               let value = loadedSecretsDictionary.value(forKey: keyString) as? String {
                secretsDictionary[keyString] = value
            }
        }
        
        for secretKey in SecretKeyName.allCases {
            if secretsDictionary[secretKey.rawValue] == nil {
                throw SecretKeyManagerError.invalidSecretsFile(message: "Api keys file missing key: \(secretKey.rawValue)")
            }
        }
    }
    
    func getSecretKey(keyName: SecretKeyName) throws -> String? {
        guard keysInitialized else {
            throw SecretKeyManagerError.notInitialized
        }
        
        let value = secretsDictionary[keyName.rawValue]
//        if let value = value {
//            AppLog.d("Returning Secret Key \(keyName.rawValue): \(value)")
//        } else {
//            AppLog.e("Failed to find key for \(keyName.rawValue)")
//        }
        
        return value
    }
    
    private func getSecretKey(keyName: String) throws -> String? {
        guard let key = SecretKeyName(rawValue: keyName) else {
            throw SecretKeyManagerError.invalidKeyName(message: "Invalid key name passed to get secret key: \(keyName)")
        }
        
        return try getSecretKey(keyName: key)
    }
}
