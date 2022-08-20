//
//  DataModelSummaryProvider.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/7/22.
//

import Foundation

public protocol DataModelSummaryProvider {
    func getSummary() -> String
}
