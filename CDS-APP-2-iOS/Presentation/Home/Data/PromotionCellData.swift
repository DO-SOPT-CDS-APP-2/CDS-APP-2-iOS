//
//  PromotionCellData.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

struct PromotionCellData {
    let image: UIImage
    let title: String
    let subTitle: String
    let percent: String
    let price: String
    let isHearted: Bool
    let heartCount: Int
}

extension PromotionCellData {
    static func additionCellDummy() -> [PromotionCellData] {
        return [PromotionCellData(image: ImageLiterals.img.imgHomeAddition2,
                                  title: StringLiterals.Home.seventhSection.maron,
                                  subTitle: StringLiterals.Home.seventhSection.firstCellSubTitle,
                                  percent: StringLiterals.Home.seventhSection.percent,
                                  price: StringLiterals.Home.seventhSection.firstCellPrice,
                                  isHearted: false,
                                  heartCount: 148),
                PromotionCellData(image: ImageLiterals.img.imgHomeAddition3,
                                  title: StringLiterals.Home.seventhSection.maron,
                                  subTitle: StringLiterals.Home.seventhSection.secondCellSubtitle,
                                  percent: StringLiterals.Home.seventhSection.percent,
                                  price: StringLiterals.Home.seventhSection.secondCellPrice,
                                  isHearted: false,
                                  heartCount: 148)]
    }
}
