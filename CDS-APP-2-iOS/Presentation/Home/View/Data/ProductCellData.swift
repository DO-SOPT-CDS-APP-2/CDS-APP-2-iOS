//
//  ProductCellData.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/28.
//

import UIKit

struct ProductCellData {
    let image: UIImage
    let title: String
    let percent: String
    let price: String
    let isHearted: Bool
}

extension ProductCellData {
    static func productCellDummy() -> [ProductCellData] {
        return [ProductCellData(image: ImageLiterals.img.imgHomeProduct1,
                                title: StringLiterals.Home.fourthSection.firstTitle,
                                percent: StringLiterals.Home.fourthSection.firstDiscount,
                                price: StringLiterals.Home.fourthSection.firstPrice,
                                isHearted: false),
                ProductCellData(image: ImageLiterals.img.imgHomeProduct2,
                                title: StringLiterals.Home.fourthSection.secondTitle,
                                percent: StringLiterals.Home.fourthSection.secondDiscount,
                                price: StringLiterals.Home.fourthSection.secondPrice,
                                isHearted: false),
                ProductCellData(image: ImageLiterals.img.imgHomeProduct3,
                                title: StringLiterals.Home.fourthSection.thirdTitle,
                                percent: StringLiterals.Home.fourthSection.thirdDiscount,
                                price: StringLiterals.Home.fourthSection.thirdPrice,
                                isHearted: false),
                ProductCellData(image: ImageLiterals.img.imgHomeProduct4,
                                title: StringLiterals.Home.fourthSection.firstTitle,
                                percent: StringLiterals.Home.fourthSection.firstDiscount,
                                price: StringLiterals.Home.fourthSection.firstPrice,
                                isHearted: false),
                ProductCellData(image: ImageLiterals.img.imgHomeProduct5,
                                title: StringLiterals.Home.fourthSection.secondTitle,
                                percent: StringLiterals.Home.fourthSection.secondDiscount,
                                price: StringLiterals.Home.fourthSection.secondPrice,
                                isHearted: false),
                ProductCellData(image: ImageLiterals.img.imgHomeProduct6,
                                title: StringLiterals.Home.fourthSection.thirdTitle,
                                percent: StringLiterals.Home.fourthSection.thirdDiscount,
                                price: StringLiterals.Home.fourthSection.thirdPrice,
                                isHearted: false),]
    }
}
