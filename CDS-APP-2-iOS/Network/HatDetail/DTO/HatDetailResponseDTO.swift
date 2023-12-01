//
//  HatDetailResponseDTO.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/30.
//

import Foundation


// MARK: - HatDetailResponseDTO
struct HatDetailResponseDTO: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let imageURL: String
    let brand, name: String
    let price, discountRate, discountPrice, point: Int
    let pointRate: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case brand, name, price, discountRate, discountPrice, point, pointRate, description
    }
}
