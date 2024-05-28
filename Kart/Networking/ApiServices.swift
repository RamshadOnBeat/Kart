//
//  ApiServices.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
import Alamofire

class ApiServices{
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func doLogin(withPhone phone: String, completion: @escaping (Result<LoginModel, ApiError>) -> Void){
        let parameter = [
            "cust_phone": phone
        ]
        
        apiClient.request(endPoint: UserEndPoints.login.stringValue, method: .post, parameter: parameter, completion: completion)
    }
    
    func loadHomeData(completion: @escaping (Result<HomeModel, ApiError>) -> Void){
        apiClient.request(endPoint: UserEndPoints.home.stringValue, method: .get, completion: completion)
    }
    
}
