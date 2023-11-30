//
//  HatCategoryDTO.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/30/23.
//

import UIKit

struct HatCategoryDataModel: Codable {
    let status: Int
    let message: String
    let data: [HatCategoryDTO]
}

struct HatCategoryDTO: Codable {
    let productId: Int
    let imageUrl: String
    let brand: String
    let name: String
    let discount: Int
    let price: Int
    
    enum Codingkeys: String, Codable {
        case productId
        case imageUrl
        case brand
        case name
        case discount
        case price
    }
}
