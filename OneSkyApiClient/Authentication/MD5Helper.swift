//
//  MD5Helper.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/22/22.
//

import Foundation
import CryptoKit

class MD5Helper {
    static func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

        return digest
            .map {
                String(format: "%02hhx", $0)
            }
            .joined()
    }
}
