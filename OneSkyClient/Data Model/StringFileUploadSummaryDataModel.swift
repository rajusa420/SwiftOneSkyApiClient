//
//  ProjectFileUploadResponseDataModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

public struct StringFileUploadSummaryDataModel: Codable, DataModelSummaryProvider {
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
    
    public func getSummary() -> String {
        return NSLocalizedString("Uploaded File - \(name) (\(language.english_name). (\(importSummary.created_at))", comment: "")
    }
}
