//
//  TaskSequence.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 8/7/22.
//

import Foundation
import OneSkyClient

enum OneSkyTask {
    case projectList(projectGroupId: String)
    case projectUpdate(projectId: String, name: String?, description: String?)
    case projectDetails(projectId: String)
    case projectStringFileUpload(
        projectId: String,
        fileFormat: ProjectFileFormat,
        localeCode: LocaleCode,
        filePath: URL
    )
    case projectTranslationFileDownload(
        projectId: String,
        localeCode: LocaleCode,
        sourceFileName: String,
        exportFilePath: URL
    )
}

enum TaskResult {
    case emptyResult
    case projectListResult(projectListSummary: [ProjectSummaryDataModel])
    case projectDetailsResult(projectDetails: ProjectDetailsDataModel)
    case projectStringFileUploadResult(uploadResult: StringFileUploadSummaryDataModel)
    case projectTranslationFileDownloadResult(downloadResult: TranslationFileDownloadSummaryModel)
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
            return .projectListResult(
                projectListSummary: try await ProjectRemoteDataSource.getProjectList(
                    forProjectGroupId: projectGroupId
                )
            )
            
        case .projectUpdate(
            let projectId,
            let name,
            let description
        ):
            try await ProjectRemoteDataSource.updateProject(
                projectId: projectId,
                name: name,
                description: description
            )
            return .emptyResult
            
        case .projectDetails(let projectId):
            return .projectDetailsResult(
                projectDetails: try await ProjectRemoteDataSource.getDetails(
                    forProjectId: projectId
                )
            )
            
        case .projectStringFileUpload(
            let projectId,
            let fileFormat,
            let localeCode,
            let filePath
        ):
            return .projectStringFileUploadResult(
                uploadResult: try await StringFileRemoteDataSource.uploadFile(
                    projectId: projectId,
                    fileFormat: fileFormat,
                    localeCode: localeCode,
                    filePath: filePath
                )
            )
            
        case .projectTranslationFileDownload(
            let projectId,
            let localeCode,
            let sourceFileName,
            let exportFilePath
        ):
            return .projectTranslationFileDownloadResult(
                downloadResult: try await TranslationRemoteDataSource.downloadTranslation(
                    projectId: projectId,
                    localeCode: localeCode,
                    sourceFileName: sourceFileName,
                    exportFilePath: exportFilePath
                )
            )
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
    
    func addProjectStringFileUploadTask(
        projectId: String,
        fileFormat: ProjectFileFormat,
        localeCode: LocaleCode,
        filePath: URL
    ) {
        taskList.append(
            .projectStringFileUpload(
                projectId: projectId,
                fileFormat: fileFormat,
                localeCode: localeCode,
                filePath: filePath
            )
        )
    }
    
    func addProjectTranslationFileDownloadTask(
        projectId: String,
        localeCode: LocaleCode,
        sourceFileName: String,
        exportFilePath: URL
    ) {
        taskList.append(
            .projectTranslationFileDownload(
                projectId: projectId,
                localeCode: localeCode,
                sourceFileName: sourceFileName,
                exportFilePath: exportFilePath
            )
        )
    }
}
