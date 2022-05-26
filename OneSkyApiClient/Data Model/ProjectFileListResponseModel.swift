//
//  ProjectFileListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

struct ProjectFileListResponseMetaModel: Codable {
    let status: Int
    let record_count: Int
    let page_count: Int
    let next_page: String?
    let prev_page: String?
    let first_page: String?
    let last_page: String?
}

struct ProjectFileLastImportModel: Codable {
    let id: Int
    let status: String
}

struct ProjectFileDataModel: Codable {
    let file_name: String
    let string_count: Int
    let last_import: ProjectFileLastImportModel
    let uploaded_at: String
    let uploaded_at_timestamp: Int
}

struct ProjectFileListResponseModel: Codable {
    let meta: ProjectFileListResponseMetaModel
    let data: [ProjectFileDataModel]
}
