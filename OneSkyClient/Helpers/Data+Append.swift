//
//  Data+Append.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/1/22.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(
            using: String.Encoding.utf8,
            allowLossyConversion: true
        ) {
            append(data)
        }
    }
}
