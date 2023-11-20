//
//  CategoryList.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

struct CategoryList {
    let label: String
}

extension CategoryList {
    static func dummy() -> [CategoryList] {
        return [CategoryList(label: "의류"),
                CategoryList(label: "가방"),
                CategoryList(label: "신발"),
                CategoryList(label: "액세서리"),
                CategoryList(label: "가구/인테리어"),
                CategoryList(label: "주방/생활"),
                CategoryList(label: "가전"),
                CategoryList(label: "컴퓨터/디지털"),
                CategoryList(label: "뷰티"),
                CategoryList(label: "푸드"),
                CategoryList(label: "레저"),
                CategoryList(label: "유아/아동"),
                CategoryList(label: "컬처")]
    }
}
