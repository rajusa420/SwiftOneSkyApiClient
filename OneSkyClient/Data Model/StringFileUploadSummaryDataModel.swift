//
//  ProjectFileUploadResponseDataModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

struct StringFileUploadSummaryDataModel: Codable {
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
