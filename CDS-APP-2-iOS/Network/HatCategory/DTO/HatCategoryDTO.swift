//
//  HatCategoryDTO.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/30/23.
//

import UIKit

struct HatCategoryDTO: Codable {
    let productId: Int
    let productImage: String
    let brandName: String
    let productName: String
    let salePercent: Int
    let productPrice: Int
    
    enum Codingkeys: String, Codable {
        case productId
        case productImage = "imageUrl"
        case brandName = "brand"
        case productName = "name"
        case salePercent = "discount"
        case productPrice = "price"
    }
}
