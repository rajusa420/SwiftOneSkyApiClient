//
//  LocaleRemoteDataSource.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/27/22.
//

import Foundation

class LocaleRemoteDataSource {
    public static func getLocaleList() async throws -> [LocaleSummaryDataModel] {
        let response: LocaleSummaryResponseModel = try await OneSkyApiService.instance.apiClient.get(ApplicationUrls.getLocaleListPath())
        return response.data
    }
}
