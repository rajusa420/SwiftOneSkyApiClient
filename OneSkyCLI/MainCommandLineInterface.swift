//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation
import OneSkyClient
import ArgumentParser

@main
struct MainCommandLineInterface: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "One Sky Api Command Line Interface allows you to hit the one sky api from the command line.",
        version: "0.0.1"
    )

    @Option(name: [.customLong("skp"), .long], help: "Path to the secret keys plist file. Requires the onesky_key and onesky_secret string entries in the dictionary.")
    var secretKeyPath: String?

    @Option(help: "One Sky Public Key")
    var publicKey: String?

    @Option(help: "One Sky Secret Key")
    var secretKey: String?
    
    @Option(help: "The Project group id")
    var projectGroupId: String?
    
    @Option(help: "The project id")
    var projectId: String?
    
    mutating func validate() throws {
        guard secretKeyPath != nil || (publicKey != nil && secretKey != nil) else {
            throw ValidationError("Error: Missing client id and client secret. Either provide them as command line arguments or provide a path to a plist file that contains them")
        }
    }

    mutating func run() async throws {
        if let secretKeyPath = secretKeyPath {
            try SecretKeysManager.instance.initialize(withSecretKeyFilePath: secretKeyPath)
        } else if let publicKey = publicKey, let secretKey = secretKey {
            SecretKeysManager.instance.initialize(withPublicKey: publicKey, secretKey: secretKey)
        }
        
        OneSkyClient.instance.initialize(
            apiKey: try OneSkySecretKeyHelper.getApiKey(),
            apiSecret: try OneSkySecretKeyHelper.getApiSecret()
        )

        try await TaskExecutor().executeTask()
    }
}

class TaskExecutor {
    @MainActor func executeTask() async throws {
        try await fetchUpdates()
    }
    
    private func fetchUpdates() async throws  {
        // The project group id: 173959
        // The project id: 387918
        // The temp project id: 387995

    //    let projectCreateTask = Task { () -> ProjectCreateSummaryDataModel in
    //        let projectCreateSummary = try await ProjectRemoteDataSource.createProject(inProjectGroupId: "173959", projectType: .iOS, name: "Raj's Test Project", description: "Just testing creating a project")
    //        return projectCreateSummary
    //    }

        let projectUpdateTask = Task { () -> Void in
            try await ProjectRemoteDataSource.updateProject(projectId: "387995", name: "My test new name", description: "Testing update")
        }

        let projectListSummaryTask = Task { () -> [ProjectSummaryDataModel] in
            let projectList = try await ProjectRemoteDataSource.getProjectList(forProjectGroupId: "173959")
            return projectList
        }

        let projectDetailsTask = Task { () -> ProjectDetailsDataModel in
            let projectDetails = try await ProjectRemoteDataSource.getDetails(forProjectId: "387995")
            return projectDetails
        }
        
        //async let projectCreateSummary = projectCreateTask.value
        try await projectUpdateTask.value
        async let projectList = projectListSummaryTask.value
        async let projectDetails = projectDetailsTask.value

        //print("Project create summary: \(try await projectCreateSummary)")
        print("Project list: \(try await projectList)")
        print("Project details: \(try await projectDetails)")
    }
}








