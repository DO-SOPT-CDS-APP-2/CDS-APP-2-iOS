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
    static func promotionCellDummy() -> [PromotionCellData] {
        return [PromotionCellData(image: ImageLiterals.img.imgHomePromotion2,
                                  title: StringLiterals.Home.thirdSection.notia,
                                  subTitle: StringLiterals.Home.thirdSection.firstCellSubtitle,
                                  percent: StringLiterals.Home.thirdSection.tenPercent,
                                  price: StringLiterals.Home.thirdSection.firstCellPrice,
                                  isHearted: false,
                                  heartCount: 148),
                PromotionCellData(image: ImageLiterals.img.imgHomePromotion3,
                                  title: StringLiterals.Home.thirdSection.notia,
                                  subTitle: StringLiterals.Home.thirdSection.secondCellSubtitle,
                                  percent: StringLiterals.Home.thirdSection.tenPercent,
                                  price: StringLiterals.Home.thirdSection.secondCellPrice,
                                  isHearted: false,
                                  heartCount: 148)]
    }
}
