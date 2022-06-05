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
    // The temp project id: 387995
    
//    let projectCreateTask = Task { () -> ProjectCreateSummaryDataModel in
//        let projectCreateSummary = try await ProjectRemoteDataSource.createProject(inProjectGroupId: "173959", projectType: .iOS, name: "Raj's Test Project", description: "Just testing creating a project")
//        return projectCreateSummary
//    }
    
    let projectListSummaryTask = Task { () -> [ProjectSummaryDataModel] in
        let projectList = try await ProjectRemoteDataSource.getProjectList(forProjectGroupId: "173959")
        return projectList
    }
    
    let projectDetailsTask = Task { () -> ProjectDetailsDataModel in
        let projectDetails = try await ProjectRemoteDataSource.getDetails(forProjectId: "387918")
        return projectDetails
    }
    
    do {
        //async let projectCreateSummary = projectCreateTask.value
        async let projectList = projectListSummaryTask.value
        async let projectDetails = projectDetailsTask.value
        
        //print("Project create summary: \(try await projectCreateSummary)")
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



