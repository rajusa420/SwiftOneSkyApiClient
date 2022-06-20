//
//  LocaleRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

open class LocaleRemoteDataSource {
    public static func getLocaleList() async throws -> [LocaleSummaryDataModel] {
        let response: LocaleSummaryResponseModel = try await OneSkyApiService.get(OneSkyUrls.getLocaleListPath())
        return response.data
    }
}
