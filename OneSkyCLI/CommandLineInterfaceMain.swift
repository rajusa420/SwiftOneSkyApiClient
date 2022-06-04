//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation
import OneSkyClient

func fetchUpdates() async {
    // The project group id: 173959
    // The project id: 387918
    let projectGroupListTask = Task { () -> [ProjectGroupSummaryDataModel] in
        let projectGroupList = try await ProjectGroupRemoteDataSource.getProjectGroupList()
        return projectGroupList
    }
    
    let projectListSummaryTask = Task { () -> [ProjectSummaryDataModel] in
        let projectList = try await ProjectRemoteDataSource.getProjectList(forProjectGroupId: "173959")
        return projectList
    }
    
    let projectDetailsTask = Task { () -> ProjectDetailsDataModel in
        let projectDetails = try await ProjectRemoteDataSource.getDetails(forProjectId: "387918")
        return projectDetails
    }
    
    do {
        async let projectGroupList = projectGroupListTask.value
        async let projectList = projectListSummaryTask.value
        async let projectDetails = projectDetailsTask.value
        
        print("Project group list: \(try await projectGroupList)")
        print("Project list: \(try await projectList)")
        print("Project details: \(try await projectDetails)")
    } catch let error as APIError {
        print("API error: \(error.getApiErrorMessage())")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

@main
struct CommandLineInterface {
    static func main() async throws {
        OneSkyClient.instance.initialize(
            apiKey: OneSkySecretKeyHelper.getApiKey(),
            apiSecret: OneSkySecretKeyHelper.getApiSecret()
        )
        await fetchUpdates()
    }
}



