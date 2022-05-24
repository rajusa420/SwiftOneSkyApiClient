//
//  ProjectListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectListResponseMetaModel: Codable {
    let status: Int
    let record_count: Int
}

struct ProjectSummaryDataModel: Codable {
    let id: Int
    let name: String?
}

struct ProjectListResponseModel: Codable {
    let meta: ProjectListResponseMetaModel
    let data: [ProjectSummaryDataModel]
}
