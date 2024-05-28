//
//  UserEndPoint.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
enum UserEndPoints{
    case login
    case home
    
    var stringValue: String{
        switch self{
        case .login:
            return "/api/login.php"
        case .home:
            return "/api/home.php"
        }
    }
}
