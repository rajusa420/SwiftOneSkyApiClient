//
//  ProjectRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

open class ProjectRemoteDataSource {
    public static func getProjectList(forProjectGroupId projectGroupId: String) async throws -> [ProjectSummaryDataModel] {
        let response: ProjectListResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.getProjectListPath(forProjectGroupId: projectGroupId))
        return response.data
    }
    
    public static func getDetails(forProjectId projectId: String) async throws -> ProjectDetailsDataModel {
        let response: ProjectDetailsResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.getProjectDetailsPath(forProjectId: projectId))
        return response.data
    }
    
    public static func getLanguages(forProjectId projectId: String) async throws -> [ProjectLanguageDataModel] {
        let response: ProjectLanguagesResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.getProjectLanguagesPath(forProjectId: projectId))
        return response.data
    }
}
