//
//  ProjectDetailsResponseModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

struct ProjectDetailsResponseModel: Codable {
    let meta: ProjectDetailsResponseMetaModel
    let data: ProjectDetailsDataModel
}
