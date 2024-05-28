//
//  LoginViewModel.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation

class LoginViewModel{
    var startAnimate: (()->Void)?
    var stopAnimate: (()->Void)?
    typealias loginCompletion = (Bool, String) -> Void
    
    private let apiService = ApiManager.shared.apiServices
    
    func Login(withPhone phone: String, completion: @escaping loginCompletion){
        startAnimate?()
        apiService.doLogin(withPhone: phone) { response in
            self.stopAnimate?()
            
            switch response{
            case .success(let data):
                if let message = data.message, let status = data.result{
                    if status == false{
                        completion(false, message)
                    }else{
                        completion(true, message)
                    }
                   
                }
            case .failure(let error):
                completion(false, error.message)
            }
        }
    }
    
}
