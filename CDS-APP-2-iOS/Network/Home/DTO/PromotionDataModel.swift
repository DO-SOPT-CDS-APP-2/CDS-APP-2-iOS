//
//  PromotionDataModel.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/30.
//

import Foundation

// MARK: - ProductDataModel
struct PromotionDataModel: Codable {
    let status: Int
    let message: String
    let data: [PromotionData]
}

// MARK: - Datum
struct PromotionData: Codable {
    let imageURL: String
    let brand, name: String
    let discount, price: Int
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case brand, name, discount, price
    }
}
