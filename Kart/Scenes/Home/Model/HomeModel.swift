//
//  HomeModel.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
// MARK: - Welcome
struct HomeModel: Codable {
    let data: DataClass
    let status: String
    let result: Bool
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let banner: [Banner]
    let recommended, flashSale, newProduct: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case banner, recommended
        case flashSale = "flash_sale"
        case newProduct = "new_product"
    }
}

// MARK: - Banner
struct Banner: Codable {
    let photo: String
}

// MARK: - FlashSale
struct FlashSale: Codable {
    let pID, pName, pCurrentPrice: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case pID = "p_id"
        case pName = "p_name"
        case pCurrentPrice = "p_current_price"
        case photo
    }
}
