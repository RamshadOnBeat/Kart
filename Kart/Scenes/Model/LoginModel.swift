//
//  LoginModel.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation

struct LoginModel: Codable {
    let data: LoginData?
    let status: String?
    let result: Bool?
    let message: String?
}

// MARK: - DataClass
struct LoginData: Codable {
    let custPhone: String
    let custOtp: Int

    enum CodingKeys: String, CodingKey {
        case custPhone = "cust_phone"
        case custOtp = "cust_otp"
    }
}

