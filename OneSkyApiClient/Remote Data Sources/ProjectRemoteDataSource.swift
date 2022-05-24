//
//  ProjectRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class ProjectRemoteDataSource {
    public static func getProjectList(forProjectGroup projectGroup: String) async throws -> [ProjectSummaryDataModel] {
        let response: ProjectListResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.getProjectListPath(forProjectGroup: projectGroup))
        return response.data
    }
}
