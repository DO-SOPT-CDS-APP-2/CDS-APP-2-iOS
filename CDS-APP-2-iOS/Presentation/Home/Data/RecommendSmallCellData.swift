//
//  RecommendSmallCellData.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

struct RecommendSmallCellData {
    let image: UIImage
    let text: String
}

extension RecommendSmallCellData {
    static func recommendSmallCellDummy() -> [RecommendSmallCellData] {
        return [RecommendSmallCellData(image: ImageLiterals.img.imgHome2,
                                       text: StringLiterals.Home.secondSection.winter),
                RecommendSmallCellData(image: ImageLiterals.img.imgHome3,
                                       text: StringLiterals.Home.secondSection.jewelry),
                RecommendSmallCellData(image: ImageLiterals.img.imgHome4,
                                       text: StringLiterals.Home.secondSection.best),
                RecommendSmallCellData(image: ImageLiterals.img.imgHome5,
                                       text: StringLiterals.Home.secondSection.present)]
    }
}
