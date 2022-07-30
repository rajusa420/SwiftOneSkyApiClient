//
//  OneSkyClient.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

public class OneSkyClient {
    public static let instance = OneSkyClient()
    
    private var apiKey: String?
    private var apiSecret: String?
    
    public func initialize(apiKey: String, apiSecret: String) {
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
    
    func getApiKey() -> String {
        guard let apiKey = apiKey else {
            fatalError(NSLocalizedString("Api key has not been initialized!", comment: ""))
        }

        return apiKey
    }
    
    func getApiSecret() -> String {
        guard let apiSecret = apiSecret else {
            fatalError(NSLocalizedString("Api secret has not been initialized!", comment: ""))
        }
        
        return apiSecret
    }
}
