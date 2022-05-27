//
//  ProjectFileUploadDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

//{
//    "meta": {
//        "status": 201
//    },
//    "data": {
//        "name": "string.po",
//        "format": "GNU_PO",
//        "language": {
//            "code": "en-US",
//            "english_name": "English (United States)",
//            "local_name": "English (United States)",
//            "locale": "en",
//            "region" : "US"
//        },
//        "import": {
//            "id": 154,
//            "created_at": "2013-10-07T15:27:10+0000",
//            "created_at_timestamp": 1381159630
//        }
//    }
//}

struct ProjectFileImportSummaryDataModel: Codable {
    let id: Int
    let created_at: String
    let created_at_timestamp: Int
}
