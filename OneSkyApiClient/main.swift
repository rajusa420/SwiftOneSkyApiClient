//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

func fetchUpdates() async {
    let projectGroupSummaryTask = Task { () -> [ProjectGroupSummaryDataModel] in
        let projectGroupList = try await ProjectGroupRemoteDataSource.getProjectGroupList()
        return projectGroupList
    }
    
    let projectListSummaryTask = Task { () -> [ProjectSummaryDataModel] in
        let projectList = try await ProjectRemoteDataSource.getProjectList(forProjectGroup: "142169")
        return projectList
    }
    
    do {
        async let projectGroupList = projectGroupSummaryTask.value
        async let projectList = projectListSummaryTask.value
        
        print("Project group list: \(try await projectGroupList)")
        print("Project list: \(try await projectList)")
    } catch let error as APIError {
        print("API error: \(error.getApiErrorMessage())")
    } catch {
        print("Error: \(error.localizedDescription)")
    }

}

Task {
    await fetchUpdates()
}

RunLoop.main.run()



