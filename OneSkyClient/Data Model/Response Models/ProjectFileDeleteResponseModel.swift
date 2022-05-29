//
//  ProjectFileDeleteResponseModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

struct ProjectFileDeleteResponseModel: Codable {
    let meta: ProjectFileListResponseMetaModel
    let data: ProjectFileDeleteSummaryDataModel
}
