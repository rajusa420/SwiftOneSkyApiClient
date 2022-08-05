//
//  OneSkyApiQueryParams.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 8/5/22.
//

import Foundation

public enum OneSkyApiQueryParam: String {
    case name = "name"
    case description = "description"
    case projectType = "project_type"
    case fileFormat = "file_format"
    case locale = "locale"
    case isKeepingAllString = "is_keeping_all_string"
}

extension URLQueryItem {
    init(name: OneSkyApiQueryParam, value: String?) {
        self.init(name: name.rawValue, value: value)
    }
}
