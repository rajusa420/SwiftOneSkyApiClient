//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

func fetchUpdates() async {
    let testTask = Task { () -> [ProjectGroupSummaryDataModel] in
        let projectGroupList = try await ProjectGroupRemoteDataSource.getProjectGroupList()
        return projectGroupList
    }
    
    do {
        let projectGroupList = try await testTask.value
        print("Project group list: \(projectGroupList)")
        print("Complete")
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



