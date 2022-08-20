//
//  ProjectDetailsDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

public struct ProjectDetailsDataModel: Codable, DataModelSummaryProvider {
    let id: Int
    let name: String
    let description: String?
    let project_type: ProjectTypeDataModel
    let string_count: Int
    let word_count: Int
    
    public func getSummary() -> String {
        return NSLocalizedString("\(id) - \(name) (\(project_type.name)). Strings: \(string_count). Words: \(word_count). ", comment: "")
    }
}
