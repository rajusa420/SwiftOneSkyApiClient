//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

func fetchUpdates() async {
    let projectListSummaryTask = Task { () -> [ProjectSummaryDataModel] in
        let projectList = try await ProjectRemoteDataSource.getProjectList(forProjectGroupId: "142169")
        return projectList
    }
    
    let projectDetailsTask = Task { () -> ProjectDetailsDataModel in
        let projectDetails = try await ProjectRemoteDataSource.getDetails(forProjectId: "314511")
        return projectDetails
    }
    
    let projectLanguagesTask = Task { () -> [ProjectLanguageDataModel] in
        let projectLanguages = try await ProjectRemoteDataSource.getLanguages(forProjectId: "314511")
        return projectLanguages
    }
    
    let projectUploadedFilesTask = Task { () -> [ProjectFileDataModel] in
        let projectFiles = try await ProjectFileRemoteDataSource.getUploadedFileList(forProjectId: "314511")
        return projectFiles
    }
    
    do {
        async let projectList = projectListSummaryTask.value
        async let projectDetails = projectDetailsTask.value
        async let projectLanguages = projectLanguagesTask.value
        async let projectUploadedFiles = projectUploadedFilesTask.value
        
        print("Project list: \(try await projectList)")
        print("Project details: \(try await projectDetails)")
        print("Project languages: \(try await projectLanguages)")
        print("Project uploaded Files: \(try await projectUploadedFiles)")
        
    } catch let error as APIError {
        print("API error: \(error.getApiErrorMessage())")
    } catch {
        print("Error: \(error.localizedDescription)")
    }

}

@main
struct CommandLineInterface {
    static func main() async throws {
        await fetchUpdates()
    }
}



