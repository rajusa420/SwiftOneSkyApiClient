//
//  ProjectFileRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

open class StringFileRemoteDataSource {
    public static func getUploadedFileList(forProjectId projectId: String) async throws -> [ProjectFileDataModel] {
        let response: StringFileListResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.getStringFilesPath(forProjectId: projectId))
        return response.data
    }
}
