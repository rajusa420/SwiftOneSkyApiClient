//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import ArgumentParser
import Foundation
import OneSkyClient

@main
struct MainCommandLineInterface: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: NSLocalizedString("One Sky Api Command Line Interface allows you to hit the one sky api from the command line.", comment: ""),
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
            throw ValidationError(NSLocalizedString("Error: Missing client id and client secret. Either provide them as command line arguments or provide a path to a plist file that contains them.", comment: ""))
        }
        
        if details || update, projectId == nil {
            throw ValidationError(NSLocalizedString("Error: Project id required.", comment: ""))
        }
        
        if list, projectGroupId == nil {
            throw ValidationError(NSLocalizedString("Error: Project group id required.", comment: ""))
        }
    }
    
    func buildTasksFromCommandLineArguments() -> TaskSequence {
        let taskSequence = TaskSequence()
        
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
        
        return taskSequence
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

//        let taskSequence = buildTasksFromCommandLineArguments()
        let taskSequence = TaskSequence()
        taskSequence.addProjectStringFileUploadTask(
            projectId: "387918",
            fileFormat: .iOSStrings,
            localeCode: .en,
            filePath: URL(fileURLWithPath: "/Users/rajusa/Rajusa/OneSkyApiClient/OneSkyClient/en.lproj/Localizable.strings", isDirectory: false, relativeTo: nil)
        )
        
        do {
            try await TaskSequenceExecutor().executeTasks(taskSequence: taskSequence)
        } catch {
            print(error.localizedDescription.redColored)
        }
    }
}
