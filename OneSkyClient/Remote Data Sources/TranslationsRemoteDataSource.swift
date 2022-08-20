//
//  TranslationsRemoteDataSource.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/5/22.
//

import Foundation

open class TranslationRemoteDataSource {
    public static func downloadTranslation(
        projectId: String,
        localeCode: LocaleCode,
        sourceFileName: String,
        exportFilePath: URL
    ) async throws -> TranslationFileDownloadSummaryModel {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: .locale, value: localeCode.code),
            URLQueryItem(name: .sourceFileName, value: sourceFileName),
            URLQueryItem(name: .exportFileName, value: exportFilePath.lastPathComponent)
        ]
        
        let (statusCode, data) = try await OneSkyApiService.getData(
            OneSkyUrls.getTranslationFilePath(forProjectId: projectId),
            queryItems: queryItems
        )
        
        try data.write(to: exportFilePath)
        
        let response: TranslationResponse
        switch statusCode {
        case 202:
            response = .accepted
        case 204:
            response = .noContent
        default:
            response = .file(data: data, localeCode: localeCode)
        }
        
        return TranslationFileDownloadSummaryModel(response: response)
    }
}
