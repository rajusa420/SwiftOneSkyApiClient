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
    case file(data: Data)
}

// The download translation end point just returns the file so we use this object to convey
// the status of the download
public struct TranslationFileDownloadSummaryModel {
    let response: TranslationResponse
}
