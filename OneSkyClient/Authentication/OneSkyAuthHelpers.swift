//
//  OneSkyAuthHelpers.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class OneSkyAuthHelpers {
    private static func getUnixTimeStampInSeconds() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    static func getTimeStampAndDevHash(apiSecret: String) -> (String, String) {
        let unixTimeStamp = String(Self.getUnixTimeStampInSeconds())
        let devHashString = unixTimeStamp + apiSecret
        return (unixTimeStamp, MD5Helper.MD5(string: devHashString))
    }
}
