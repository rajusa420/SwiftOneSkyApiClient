//
//  ProjectFileRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

open class StringFileRemoteDataSource {
    public static func getUploadedFileList(forProjectId projectId: String) async throws -> [ProjectFileDataModel] {
        let response: StringFileListResponseModel = try await OneSkyApiService.get(OneSkyUrls.getStringFilesPath(forProjectId: projectId))
        return response.data
    }
    
    public static func uploadFile(
        projectId: String,
        fileFormat: ProjectFileFormat,
        localeCode: LocaleCode,
        filePath: URL
    ) async throws -> StringFileUploadSummaryDataModel {
        // TODO: Don't know why this is failing?
//        guard FileManager.default.fileExists(atPath: filePath.absoluteString) else {
//            throw APIError.invalidUploadFilePath(message: filePath.absoluteString)
//        }
        
        let fileData = try Data(contentsOf: filePath)
        guard fileData.count > 0 else {
            throw APIError.invalidUploadFile(message: filePath.absoluteString)
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: .fileFormat, value: fileFormat.rawValue),
            URLQueryItem(name: .locale, value: localeCode.code),
            URLQueryItem(name: .isKeepingAllString, value: "true")
        ]
        
        let response: ProjectFileUploadResponseModel = try await OneSkyApiService
            .post(
                OneSkyUrls.getStringFilesPath(forProjectId: projectId),
                multipartFormRequestData: MultipartFormRequestData(
                    filename: filePath.lastPathComponent,
                    mimeType: .octetStream,
                    data: fileData
                ),
                queryItems: queryItems
            )
        
        return response.data
    }
}
