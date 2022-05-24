//
//  ProjectGroupListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectGroupListResponseMetaModel: Codable {
    let status: Int
    let record_count: Int
    let page_count: Int
    let next_page: String
    let prev_page: String
    let first_page: String
    let last_page: String
}

struct ProjectGroupSummaryDataModel: Codable {
    let id: Int
    let name: String
}

struct ProjectGroupListDataModel: Codable {
    let data: [ProjectGroupSummaryDataModel]
}

struct ProjectGroupListResponseModel: Codable {
    let meta: ProjectGroupListResponseMetaModel
    let data: ProjectGroupListDataModel
    
    var status: Int {
        meta.status
    }
}
