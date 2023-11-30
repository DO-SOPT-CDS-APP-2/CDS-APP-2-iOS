//
//  PopularCellData.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/29.
//

import UIKit

struct PopularCellData {
    let image: UIImage
}

extension PopularCellData {
    static func popularCellData() -> [PopularCellData] {
        return [PopularCellData(image: ImageLiterals.img.imgHomePopular1),
                PopularCellData(image: ImageLiterals.img.imgHomePopular2),
                PopularCellData(image: ImageLiterals.img.imgHomePopular3),
                PopularCellData(image: ImageLiterals.img.imgHomePopular4),
                PopularCellData(image: ImageLiterals.img.imgHomePopular5),
                PopularCellData(image: ImageLiterals.img.imgHomePopular6),
                PopularCellData(image: ImageLiterals.img.imgHomePopular7),
                PopularCellData(image: ImageLiterals.img.imgHomePopular8),
                PopularCellData(image: ImageLiterals.img.imgHomePopular9),
                PopularCellData(image: ImageLiterals.img.imgHomePopular10),
                PopularCellData(image: ImageLiterals.img.imgHomePopular11),
                PopularCellData(image: ImageLiterals.img.imgHomePopular12)]
    }
}

