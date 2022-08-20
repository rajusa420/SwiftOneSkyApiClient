//
//  TranslationFileDownloadSummary.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/7/22.
//

import Foundation

public enum TranslationResponse {
    case accepted
    case noContent
    case file(data: Data, localeCode: LocaleCode)
}

// The download translation end point just returns the file so we use this object to convey
// the status of the download
public struct TranslationFileDownloadSummaryModel: DataModelSummaryProvider {
    let response: TranslationResponse
    
    public func getSummary() -> String {
        switch response {
        case .accepted:
            return NSLocalizedString("Translation request has been accepted.", comment: "")
        case .noContent:
            return NSLocalizedString("The content is not ready yet.", comment: "")
        case .file(let data, let localeCode):
            return NSLocalizedString("\(localeCode.englishName) (\(localeCode.code)) - Downloaded (\(data.count) bytes)", comment: "")
        }
    }
}
