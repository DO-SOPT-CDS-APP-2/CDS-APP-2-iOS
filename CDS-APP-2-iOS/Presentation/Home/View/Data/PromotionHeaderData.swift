//
//  PromotionHeaderData.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

struct PromotionHeaderData {
    let bannerImage: UIImage
    let title: String
    let subTitle: String
}

extension PromotionHeaderData {
    static func thirdSectionHeaderData() -> PromotionHeaderData {
        return PromotionHeaderData(bannerImage: ImageLiterals.img.imgHomePromotion1,
                                   title: StringLiterals.Home.thirdSection.headerTitle,
                                   subTitle: StringLiterals.Home.thirdSection.headerSubTitle)
    }
}
