//
//  ProjectLanguageDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/26/22.
//

import Foundation

public struct ProjectLanguageDataModel: Codable {
    let code: String
    let english_name: String
    let local_name: String
    let locale: String
    let region: String
    let is_base_language: Bool
    let is_ready_to_publish: Bool
    let translation_progress: String
    let last_updated_at: String
    let last_updated_at_timestamp: Int
}
