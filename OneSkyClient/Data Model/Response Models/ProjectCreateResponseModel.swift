//
//  ProjectCreateResponseModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 6/5/22.
//

import Foundation

struct ProjectCreateResponseModel: Codable {
    let meta: ProjectCreateResponseMetaModel
    let data: ProjectCreateSummaryDataModel
}
