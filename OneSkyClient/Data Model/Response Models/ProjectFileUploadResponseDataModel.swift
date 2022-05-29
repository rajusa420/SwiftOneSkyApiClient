//
//  ProjectFileUploadResponseDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

struct ProjectFileUploadResponseModel: Codable {
    let meta: ProjectFileUploadMetaModel
    let data: ProjectFileUploadResponseDataModel
}
