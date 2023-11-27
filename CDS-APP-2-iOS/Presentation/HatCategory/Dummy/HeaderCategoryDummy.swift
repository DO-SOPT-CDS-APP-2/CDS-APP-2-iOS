//
//  HeaderCategoryDummy.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/23/23.
//

import UIKit

struct HeaderCategory {
    let label: String
}

extension HeaderCategory {
    static func headerDummy() -> [HeaderCategory] {
        return [
            HeaderCategory(label: StringLiterals.HatCategory.header.all),
            HeaderCategory(label: StringLiterals.HatCategory.header.beanie),
            HeaderCategory(label: StringLiterals.HatCategory.header.ballCap),
            HeaderCategory(label: StringLiterals.HatCategory.header.bucketHat),
            HeaderCategory(label: StringLiterals.HatCategory.header.balaclava),
            HeaderCategory(label: StringLiterals.HatCategory.header.beret),
            HeaderCategory(label: StringLiterals.HatCategory.header.trapper),
            HeaderCategory(label: StringLiterals.HatCategory.header.fedora)
        ]
    }
}

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

        ]
    }
}
