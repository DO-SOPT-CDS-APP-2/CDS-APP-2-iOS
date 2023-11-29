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
}

extension RealtimeBestItem{
    static func realtimeBestDummy() -> [RealtimeBestItem] {
        return [
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory1,
                             brandName: StringLiterals.HatCategory.main.realtimeBest.product1.name,
                             salePercent: StringLiterals.HatCategory.main.realtimeBest.product1.salePercent,
                             itemPrice: StringLiterals.HatCategory.main.realtimeBest.product1.price),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory2, 
                             brandName: StringLiterals.HatCategory.main.realtimeBest.product2.name,
                             salePercent: StringLiterals.HatCategory.main.realtimeBest.product2.salePercent,
                             itemPrice: StringLiterals.HatCategory.main.realtimeBest.product2.price),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory3,
                             brandName: StringLiterals.HatCategory.main.realtimeBest.product3.name,
                             salePercent: StringLiterals.HatCategory.main.realtimeBest.product3.salePercent,
                             itemPrice: StringLiterals.HatCategory.main.realtimeBest.product3.price),
            RealtimeBestItem(image: ImageLiterals.img.imgHatCategory4,
                             brandName: StringLiterals.HatCategory.main.realtimeBest.product4.name,
                             salePercent: StringLiterals.HatCategory.main.realtimeBest.product4.salePercent,
                             itemPrice: StringLiterals.HatCategory.main.realtimeBest.product4.price)
        ]
    }
}

struct FilterCategory {
    let label: String
}

extension FilterCategory {
    static func filterCategoryDummy() -> [FilterCategory] {
        return [
            FilterCategory(label: StringLiterals.HatCategory.main.filter.recommend),
            FilterCategory(label: StringLiterals.HatCategory.main.filter.color),
            FilterCategory(label: StringLiterals.HatCategory.main.filter.priceRange),
            FilterCategory(label: StringLiterals.HatCategory.main.filter.productInfo),
            FilterCategory(label: StringLiterals.HatCategory.main.filter.brand)
        ]
    }
}
