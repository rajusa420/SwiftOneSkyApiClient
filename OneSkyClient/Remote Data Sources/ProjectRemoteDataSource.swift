//
//  ProjectRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct EmptyRequestBody: Codable {
}

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
    
    public static func createProject(inProjectGroupId projectGroupId: String, projectType: ProjectTypeCode, name: String?, description: String?) async throws -> ProjectCreateSummaryDataModel {
        var queryItems: [URLQueryItem] = [URLQueryItem(name: "project_type", value: projectType.rawValue)]
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        
        if let description = description {
            queryItems.append(URLQueryItem(name: "description", value: description))
        }
        
        let response: ProjectCreateResponseModel = try await OneSkyApiService.instance.apiClient.post(
            OneSkyUrls.getProjectListPath(forProjectGroupId: projectGroupId),
            body: EmptyRequestBody(),
            queryItems: queryItems)
        
        return response.data
    }
}
