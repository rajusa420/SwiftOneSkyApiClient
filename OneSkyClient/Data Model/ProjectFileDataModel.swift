//
//  ProjectFileDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

public struct ProjectFileLastImportModel: Codable {
    let id: Int
    let status: String
}

public struct ProjectFileDataModel: Codable {
    let file_name: String
    let string_count: Int
    let last_import: ProjectFileLastImportModel
    let uploaded_at: String
    let uploaded_at_timestamp: Int
}
