//
//  ProjectCreateSummaryDataModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 6/5/22.
//

import Foundation

public struct ProjectCreateSummaryDataModel: Codable {
    let id: Int
    let project_type: ProjectTypeDataModel
    let name: String?
    let description: String?
}
