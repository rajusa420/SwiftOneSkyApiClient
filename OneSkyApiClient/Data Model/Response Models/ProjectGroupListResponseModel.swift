//
//  ProjectGroupListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectGroupListResponseModel: Codable {
    let meta: ProjectGroupListResponseMetaModel
    let data: [ProjectGroupSummaryDataModel]
    
    var status: Int {
        meta.status
    }
}
