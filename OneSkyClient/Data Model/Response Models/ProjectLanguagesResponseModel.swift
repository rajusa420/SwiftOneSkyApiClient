//
//  ProjectLanguagesResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/25/22.
//

import Foundation

struct ProjectLanguagesResponseModel: Codable {
    let meta: ProjectLanguagesResponseMetaModel
    let data: [ProjectLanguageDataModel]
}
