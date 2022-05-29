//
//  ProjectListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectListResponseModel: Codable {
    let meta: ProjectListResponseMetaModel
    let data: [ProjectSummaryDataModel]
}
