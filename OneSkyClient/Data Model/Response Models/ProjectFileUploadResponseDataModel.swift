//
//  ProjectFileUploadResponseDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

struct ProjectFileUploadResponseDataModel: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case format
        case language
        case importSummary = "import"
    }
    
    let name: String
    let format: String
    let language: LocaleSummaryDataModel
    let importSummary: ProjectFileImportSummaryDataModel
}
