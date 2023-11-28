//
//  RecommendItem.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

struct RecommendItem {
    let image: UIImage
    let brandNameKR: String
    let brandNameEN: String
    let salePercent: String
    let price: String
    let shipping: String
}

extension RecommendItem{
    static func recommendDummy() -> [RecommendItem] {
        return [
            RecommendItem(image: ImageLiterals.img.imgHatRecommend1, brandNameKR: "타입서비스", brandNameEN: "Typeservice Web Sti...", salePercent: "10%", price: "35,100원", shipping: "무료배송"),
            RecommendItem(image: ImageLiterals.img.imgHatRecommend2, brandNameKR: "타입서비스", brandNameEN: "Arch Logo Ball Cap [...", salePercent: "10%", price: "39,000원", shipping: "무료배송"),
            RecommendItem(image: ImageLiterals.img.imgHatRecommend3, brandNameKR: "타입서비스", brandNameEN: "Arch Logo Ball Cap [...", salePercent: "40%", price: "25,800원", shipping: "무료배송"),
            RecommendItem(image: ImageLiterals.img.imgHatRecommend4, brandNameKR: "타입서비스", brandNameEN: "Corduroy Graphic W...", salePercent: "20%", price: "34,400원", shipping: "무료배송"),
        ]
    }
    
}

