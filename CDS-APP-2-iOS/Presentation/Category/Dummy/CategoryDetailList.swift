//
//  CategoryDetailList.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

struct CategoryDetailList {
    let label: String
}

extension CategoryDetailList {
    static func dummy() -> [CategoryDetailList] {
        return [CategoryDetailList(label: "전체"),
                CategoryDetailList(label: "FOR YOU"),
                CategoryDetailList(label: "BEST"),
                CategoryDetailList(label: "NEW"),
                CategoryDetailList(label: "머플러"),
                CategoryDetailList(label: "모자"),
                CategoryDetailList(label: "주얼리"),
                CategoryDetailList(label: "장갑"),
                CategoryDetailList(label: "헤어 액세서리"),
                CategoryDetailList(label: "양말"),
                CategoryDetailList(label: "지갑,카드케이스"),
                CategoryDetailList(label: "기타 액세서리"),
                CategoryDetailList(label: "넥워머"),
                CategoryDetailList(label: "아이웨어"),
                CategoryDetailList(label: "스카프"),
                CategoryDetailList(label: "벨트"),
                CategoryDetailList(label: "시계"),
                CategoryDetailList(label: "EXCLUSIVE"),
                CategoryDetailList(label: "해외브랜드")]
    }
}
