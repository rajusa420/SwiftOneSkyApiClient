//
//  ProjectDetailsResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectDetailsResponseMetaModel: Codable {
    let status: Int
}

struct ProjectTypeDataModel: Codable {
    let code: String
    let name: String
}

struct ProjectDetailsDataModel: Codable {
    let id: Int
    let name: String
    let description: String?
    let project_type: ProjectTypeDataModel
    let string_count: Int
    let word_count: Int
}

struct ProjectDetailsResponseModel: Codable {
    let meta: ProjectDetailsResponseMetaModel
    let data: ProjectDetailsDataModel
}
