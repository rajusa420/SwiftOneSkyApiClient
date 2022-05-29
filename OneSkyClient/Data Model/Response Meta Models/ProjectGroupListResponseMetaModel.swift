//
//  ProjectGroupListResponseMetaModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

struct ProjectGroupListResponseMetaModel: Codable {
    let status: Int
    let record_count: Int
    let page_count: Int
    let next_page: String?
    let prev_page: String?
    let first_page: String?
    let last_page: String?
}
