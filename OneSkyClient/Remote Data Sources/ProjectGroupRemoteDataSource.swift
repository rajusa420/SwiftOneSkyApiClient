//
//  ProjectGroupRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

open class ProjectGroupRemoteDataSource {
    public static func getProjectGroupList() async throws -> [ProjectGroupSummaryDataModel] {
        let response: ProjectGroupListResponseModel = try await OneSkyApiService.instance.apiClient.get(OneSkyUrls.projectGroupListPath)
        return response.data
    }
}
