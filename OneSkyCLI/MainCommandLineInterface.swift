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
    
    @Option(name: [.short, .long], help: "The project id")
    var projectId: String?
    
    @Option
    var name: String?
    
    @Option
    var description: String?
    
    @Flag(help: "Displays the details for the supplied project id")
    var details: Bool = false
    
    @Flag()
    var update: Bool = false
    
    @Flag()
    var list: Bool = false
    
    mutating func validate() throws {
        guard secretKeyPath != nil || (publicKey != nil && secretKey != nil) else {
            throw ValidationError("Error: Missing client id and client secret. Either provide them as command line arguments or provide a path to a plist file that contains them.")
        }
        
        if (details || update) && projectId == nil {
            throw ValidationError("Error: Project id required.")
        }
        
        if list && projectGroupId == nil {
            throw ValidationError("Error: Project group id required.")
        }
    }
    
    func buildTasksFromCommandLineArguments() async throws {
        let taskSequence = TaskSequence()
        let taskSequenceExecutor = TaskSequenceExecutor()
        if let projectId = projectId {
            if update {
                taskSequence.addProjectUpdateTask(projectId: projectId, projectName: name, projectDescription: description)
                taskSequence.addProjectDetailsTask(projectId: projectId)
            } else if details {
                taskSequence.addProjectDetailsTask(projectId: projectId)
            }
        }
        
        if let projectGroupId = projectGroupId {
            if list {
                taskSequence.addProjectListTask(projectGroupId: projectGroupId)
            }
        }
        
        try await taskSequenceExecutor.executeTasks(taskSequence: taskSequence)
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

        try await buildTasksFromCommandLineArguments()
    }
}

enum OneSkyTask {
    case projectList(projectGroupId: String)
    case projectUpdate(projectId: String, name: String?, description: String?)
    case projectDetails(projectId: String)
}

enum TaskResult {
    case emptyResult
    case projectListResult(projectListSummary: [ProjectSummaryDataModel])
    case projectDetailsResult(projectDetails: ProjectDetailsDataModel)
}

class TaskSequence: AsyncSequence, AsyncIteratorProtocol {
    typealias Element = TaskResult
    var taskList: [OneSkyTask] = []
    
    func next() async throws -> Element? {
        guard !taskList.isEmpty else {
            return nil
        }
        
        let nextTask = taskList.removeFirst()
        return try await executeTask(task: nextTask)
    }
    
    func executeTask(task: OneSkyTask) async throws -> Element {
        switch task {
        case .projectList(let projectGroupId):
            return .projectListResult(projectListSummary: try await ProjectRemoteDataSource.getProjectList(forProjectGroupId: projectGroupId))
        case .projectUpdate(let projectId, let name, let description):
            try await ProjectRemoteDataSource.updateProject(projectId: projectId, name: name, description: description)
            return .emptyResult
        case .projectDetails(let projectId):
            return .projectDetailsResult(projectDetails: try await ProjectRemoteDataSource.getDetails(forProjectId: projectId))
        }
    }
    
    func makeAsyncIterator() -> TaskSequence {
        return self
    }
    
    func addProjectDetailsTask(projectId: String) {
        taskList.append(.projectDetails(projectId: projectId))
    }
    
    func addProjectUpdateTask(projectId: String, projectName: String?, projectDescription: String?) {
        taskList.append(.projectUpdate(projectId: projectId, name: projectName, description: projectDescription))
    }
    
    func addProjectListTask(projectGroupId: String) {
        taskList.append(.projectList(projectGroupId: projectGroupId))
    }
}

class TaskSequenceExecutor {
    
    @MainActor func executeTasks(taskSequence: TaskSequence) async throws {
        // The project group id: 173959
        // The project id: 387918
        // The temp project id: 387995
        let taskIterator = taskSequence.makeAsyncIterator()
        while let taskResult = try await taskIterator.next() {
            displayTaskResultSummary(taskResult: taskResult)
        }
    }
    
    private func displayTaskResultSummary(taskResult: TaskResult) {
        switch taskResult {
        case .emptyResult:
            print("Task had an empty result.")
        case .projectListResult(let projectListSummary):
            print("The project list summary: \(projectListSummary)")
        case .projectDetailsResult(let projectDetails):
            print("The project details: \(projectDetails)")
        }
    }
    
    private func fetchUpdates() async throws {
    //    let projectCreateTask = Task { () -> ProjectCreateSummaryDataModel in
    //        let projectCreateSummary = try await ProjectRemoteDataSource.createProject(inProjectGroupId: "173959", projectType: .iOS, name: "Raj's Test Project", description: "Just testing creating a project")
    //        return projectCreateSummary
    //    }
    }
}








