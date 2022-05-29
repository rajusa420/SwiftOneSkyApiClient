//
//  ProjectFileRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

open class ProjectFileRemoteDataSource {
    public static func getUploadedFileList(forProjectId projectId: String) async throws -> [ProjectFileDataModel] {
        let response: ProjectFileListResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.getProjectFilesPath(forProjectId: projectId))
        return response.data
    }
}
