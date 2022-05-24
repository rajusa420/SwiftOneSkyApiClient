//
//  main.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/18/22.
//

import Foundation

Task {
    do {
        let projectGroupList = try await ProjectGroupRemoteDataSource.getProjectGroupList()
        print(projectGroupList.data)
    } catch let error as APIError {
        print("API error: \(error.getApiErrorMessage())")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

print("Hello, World!")

