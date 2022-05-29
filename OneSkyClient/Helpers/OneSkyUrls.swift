//
//  ApplicationUrls.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class OneSkyUrlConstants {
    public static var urlProtocol: String {
        return "https://"
    }
    
    public static var domain: String {
        return "platform.api.onesky.io/1"
    }
}

class OneSkyUrls {
    public static var basePath: String {
        return "\(OneSkyUrlConstants.urlProtocol)\(OneSkyUrlConstants.domain)"
    }
    
    public static var projectGroupListPath: String = "project-groups"
    
    // TODO: Should I just convert all of these to functions because some require parameters
    public static func getProjectListPath(forProjectGroupId projectGroupId: String) -> String {
        return "\(self.projectGroupListPath)/\(projectGroupId)/projects"
    }
    
    public static func getProjectDetailsPath(forProjectId projectId: String) -> String {
        return "projects/\(projectId)"
    }
    
    public static func getProjectLanguagesPath(forProjectId projectId: String) -> String {
        return "projects/\(projectId)/languages"
    }
    
    public static func getProjectFilesPath(forProjectId projectId: String) -> String {
        return "projects/\(projectId)/files"
    }
    
    public static func getLocaleListPath() -> String {
        return "locales"
    }
}
