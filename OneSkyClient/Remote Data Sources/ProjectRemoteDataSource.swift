//
//  ProjectRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

open class ProjectRemoteDataSource {
    public static func getProjectList(forProjectGroupId projectGroupId: String) async throws -> [ProjectSummaryDataModel] {
        let response: ProjectListResponseModel = try await OneSkyApiService.get(OneSkyUrls.getProjectListPath(forProjectGroupId: projectGroupId))
        return response.data
    }
    
    public static func getDetails(forProjectId projectId: String) async throws -> ProjectDetailsDataModel {
        let response: ProjectDetailsResponseModel = try await OneSkyApiService.get(OneSkyUrls.getProjectDetailsPath(forProjectId: projectId))
        return response.data
    }
    
    public static func getLanguages(forProjectId projectId: String) async throws -> [ProjectLanguageDataModel] {
        let response: ProjectLanguagesResponseModel = try await OneSkyApiService.get(OneSkyUrls.getProjectLanguagesPath(forProjectId: projectId))
        return response.data
    }
    
    public static func createProject(inProjectGroupId projectGroupId: String, projectType: ProjectTypeCode, name: String?, description: String?) async throws -> ProjectCreateSummaryDataModel {
        var queryItems: [URLQueryItem] = [URLQueryItem(name: .projectType, value: projectType.rawValue)]
        if let name = name {
            queryItems.append(URLQueryItem(name: .name, value: name))
        }
        
        if let description = description {
            queryItems.append(URLQueryItem(name: .description, value: description))
        }
        
        let response: ProjectCreateResponseModel = try await OneSkyApiService.post(
            OneSkyUrls.getProjectListPath(forProjectGroupId: projectGroupId),
            body: EmptyRequestBody(),
            queryItems: queryItems
        )
        
        return response.data
    }
    
    public static func updateProject(projectId: String, name: String?, description: String?) async throws {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: .name, value: name),
            URLQueryItem(name: .description, value: description)
        ]
        
        let _: EmptyResponseBody = try await OneSkyApiService.put(
            OneSkyUrls.getProjectDetailsPath(forProjectId: projectId),
            body: EmptyRequestBody(),
            queryItems: queryItems
        )
    }
    
    public static func deleteProject(projectId: String) async throws {
        let _: EmptyResponseBody = try await OneSkyApiService
            .delete(
                OneSkyUrls.getProjectDetailsPath(forProjectId: projectId),
                queryItems: nil
            )
    }    
}
