//
//  UserDefaultManger.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
class UserDefaultManger{
    static let shared = UserDefaultManger()
    
    private let tokem_key = "token"
    
    private let preference = UserDefaults.standard
    
    private init(){}
    
    var token : String?{
        get{
            preference.string(forKey: tokem_key)
        }
        set{
            preference.setValue(newValue, forKey: tokem_key)
            save()
        }
    }
    
    func save(){
        preference.synchronize()
    }
    
}
