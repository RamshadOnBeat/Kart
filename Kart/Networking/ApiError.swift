//
//  ApiError.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation

enum ApiError: Error{
    case invalidRespnse
    case invalidUrl
    case apiError(message: String)
    case generalError
    case network
    
    var message: String{
        switch self{
            
        case .invalidRespnse:
            return "Invalid Response"
        case .invalidUrl:
            return "Requested Url is not found"
        case .apiError(message: let message):
            return message
        case .generalError:
            return "Something went wrong, Please try again later...!"
        case .network:
           return "Please Check your internet connection...!"
        }
    }

}
