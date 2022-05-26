//
//  ProjectFileRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

class ProjectFileRemoteDataSource {
    public static func getUploadedFileList(forProjectId projectId: String) async throws -> [ProjectFileDataModel] {
        let response: ProjectFileListResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.getProjectFileListPath(forProjectId: projectId))
        return response.data
    }
}
