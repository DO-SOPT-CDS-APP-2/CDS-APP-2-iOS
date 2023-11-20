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
                CategoryDetailList(label: "아우터"),
                CategoryDetailList(label: "상의"),
                CategoryDetailList(label: "니트웨어"),
                CategoryDetailList(label: "바지"),
                CategoryDetailList(label: "원피스"),
                CategoryDetailList(label: "스커트"),
                CategoryDetailList(label: "홈웨어"),
                CategoryDetailList(label: "액티브웨어"),
                CategoryDetailList(label: "이너웨어"),
                CategoryDetailList(label: "EXCLUSIVE"),
                CategoryDetailList(label: "해외브랜드"),
                CategoryDetailList(label: "점프수트")]
    }
}
