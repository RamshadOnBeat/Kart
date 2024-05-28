//
//  ApiClient.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
import Alamofire

protocol ApiClientProtocol{
    func request<T:Decodable>(endPoint: String, method: HTTPMethod , parameter: Parameters? ,header: HTTPHeaders? ,completion: @escaping (Result<T, ApiError>) -> Void)
}

class ApiClient: ApiClientProtocol{
    func request<T>(endPoint: String, method: HTTPMethod = .get,parameter: Parameters? = nil, header: HTTPHeaders? = nil,completion: @escaping (Result<T, ApiError>) -> Void) where T : Decodable {
        
        guard let Url = URL(string: AppUrl.BASE_URL + endPoint) else{
            return completion(.failure(ApiError.invalidUrl))
        }
        
        guard Reachability.isConnectedToNetwork() else{
            return completion(.failure(ApiError.network))
        }
        
        AF.request(Url, method: method, parameters: parameter, encoding: URLEncoding.default, headers: header).validate().responseDecodable(of: T.self){
            result in
            switch result.result{
            case .success:
                guard let data = result.data else{
                    return completion(.failure(ApiError.invalidRespnse))
                }
                
                do{
                    let decorder = JSONDecoder()
                    let jsonData = try decorder.decode(T.self, from: data)
                    completion(.success(jsonData))
                }catch{
                    completion(.failure(ApiError.generalError))
                }
            case .failure:
                completion(.failure(ApiError.invalidRespnse))
            }
            
        }
    }
    
    
}
