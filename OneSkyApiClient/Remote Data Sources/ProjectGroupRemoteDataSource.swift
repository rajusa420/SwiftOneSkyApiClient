//
//  ProjectGroupRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class ProjectGroupRemoteDataSource {
    public static func getProjectGroupList() async throws -> ProjectGroupListDataModel {
        let response: ProjectGroupListResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.projectGroupListPath)
        return response.data
    }
}
