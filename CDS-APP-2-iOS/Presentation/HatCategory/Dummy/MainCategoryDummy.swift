//
//  MainCategoryDummy.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/27/23.
//

import UIKit

struct RealtimeBestItem {
    let image: UIImage
    let brandName: String
    let salePercent: String
    let itemPrice: String
    let rankingNumber: Int
}

extension RealtimeBestItem{
    static func realtimeBestDummy() -> [RealtimeBestItem] {
        return [
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory1, brandName: "타입서비스", salePercent: "5%", itemPrice: "37,050", rankingNumber: 1),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory2, brandName: "슬리피슬립", salePercent: "10%", itemPrice: "52,200", rankingNumber: 2),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory3, brandName: "론론", salePercent: "15%", itemPrice: "140,250", rankingNumber: 3),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory4, brandName: "시엔느", salePercent: "7%", itemPrice: "54,500", rankingNumber: 4)
        ]
    }
}
