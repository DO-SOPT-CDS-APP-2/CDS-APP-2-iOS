//
//  Category.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

struct Category {
    let image: UIImage
    let label: String
}

extension Category {
    static func dummy() -> [Category] {
        return [Category(image: ImageLiterals.img.imgCollect, label: "모아보기"),
                Category(image: ImageLiterals.img.imgShowcase, label: "쇼케이스"),
                Category(image: ImageLiterals.img.imgPT, label: "PT"),
                Category(image: ImageLiterals.img.imgPressent, label: "선물하기"),
                Category(image: ImageLiterals.img.imgForeign, label: "해외브랜드"),
                Category(image: ImageLiterals.img.img29F, label: "프리미엄홈"),
                Category(image: ImageLiterals.img.img29, label: "전시공간"),
                Category(image: ImageLiterals.img.imgDunst, label: "던스트"),
                Category(image: ImageLiterals.img.imgTableWare, label: "테이블웨어"),
                Category(image: ImageLiterals.img.imgEvent, label: "이벤트"),
                Category(image: ImageLiterals.img.imgLivingStyle, label: "리빙스타일"),
                Category(image: ImageLiterals.img.imgWelove, label: "WELOVE"),
                Category(image: ImageLiterals.img.imgLookBook, label: "룩북"),
                Category(image: ImageLiterals.img.imgSpecialOrder, label: "스페셜오더")]
    }
}
