//
//  OneSkyApiService.swift
//  OneSkyApiClient
//
//  Created by Raj Sathianarayanan on 5/24/22.
//

import Foundation

class OneSkyApiService {
    static let instance = OneSkyApiService()
    lazy var apiClient = OneSkyApiClient(baseURL: OneSkyUrls.basePath)
}
