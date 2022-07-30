//
//  TaskSequenceExecutor.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 6/20/22.
//

import Foundation
import OneSkyClient

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
            print(NSLocalizedString("Task had an empty result.", comment: "").greenColored)
        case .projectListResult(let projectListSummary):
            print(NSLocalizedString("The project list summary: \(projectListSummary)", comment: "").greenColored)
        case .projectDetailsResult(let projectDetails):
            print(NSLocalizedString("The project details: \(projectDetails)", comment: "").cyanColored)
        }
    }
}
