//
//  ProjectTypeDataModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 6/5/22.
//

import Foundation

public enum ProjectTypeCode: String {
    case iOS = "ios"
    case android = "android"
    case website = "website"
}

public struct ProjectTypeDataModel: Codable {
    let code: String
    let name: String
}
