//
//  ProjectFileDeleteSummaryDataModel.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 5/29/22.
//

import Foundation

//{
//    "meta": {
//        "status": 200
//    },
//    "data": {
//        "name": "string.po"
//    }
//}

struct ProjectFileDeleteSummaryDataModel: Codable {
    let name: String
}
