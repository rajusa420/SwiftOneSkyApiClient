//
//  LocaleSummaryDataModel.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

struct LocaleSummaryMetaModel: Codable {
    let status: Int
    let record_count: Int
}

struct LocaleSummaryDataModel: Codable {
    let code: String
    let english_name: String
    let local_name: String
    let locale: String
    let region: String
}

struct LocaleSummaryResponseModel: Codable {
    let meta: LocaleSummaryMetaModel
    let data: [LocaleSummaryDataModel]
}
