//
//  ProjectFileListResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

struct ProjectFileListResponseModel: Codable {
    let meta: ProjectFileListResponseMetaModel
    let data: [ProjectFileDataModel]
}
