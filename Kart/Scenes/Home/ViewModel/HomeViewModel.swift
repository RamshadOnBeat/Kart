//
//  HomeViewModel.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
class HomeViewModel{
    var startAnimate: (()->Void)?
    var stopAnimate: (()->Void)?
    private let apiService = ApiManager.shared.apiServices
    
    func loadHomeData(){
        apiService.loadHomeData { response in
            print(response)
        }
    }
}
