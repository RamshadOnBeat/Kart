//
//  ApiManager.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation

class ApiManager{
    static let shared = ApiManager()
    
    private let apiClient : ApiClient
    let apiServices : ApiServices
    
    private init(){
        apiClient = ApiClient()
        apiServices = ApiServices(apiClient: apiClient)
    }
}
