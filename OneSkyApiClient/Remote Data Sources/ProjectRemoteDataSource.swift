//
//  ProjectRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class ProjectRemoteDataSource {
    public static func getProjectList(forProjectGroupId projectGroupId: String) async throws -> [ProjectSummaryDataModel] {
        let response: ProjectListResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.getProjectListPath(forProjectGroupId: projectGroupId))
        return response.data
    }
    
    public static func getProjectDetails(forProjectId projectId: String) async throws -> ProjectDetailsDataModel {
        let response: ProjectDetailsResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.getProjectDetailsPath(forProjectId: projectId))
        return response.data
    }
}
