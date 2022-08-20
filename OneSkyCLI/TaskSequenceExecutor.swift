//
//  TaskSequenceExecutor.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 6/20/22.
//

import Foundation
import OneSkyClient

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
            print(NSLocalizedString("The project details: \(projectDetails.getSummary())", comment: "").cyanColored)
        case .projectStringFileUploadResult(let uploadSummary):
            print(NSLocalizedString("Upload Successful: Summary - \(uploadSummary.getSummary())", comment: "").cyanColored)
        case .projectTranslationFileDownloadResult(let downloadResult):
            print(NSLocalizedString("Download Successful: \(downloadResult.getSummary())", comment: "").cyanColored)
        }
    }
}
