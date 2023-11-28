//
//  InquireList.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

struct InquireList {
    let label: String
}

extension InquireList {
    static func inquiredummy() -> [InquireList] {
        return [InquireList(label: "상품번호"),
                InquireList(label: "배송정보, 교환/환불안내"),
                InquireList(label: "상품정보 보기"),
                InquireList(label: "판매자정보"),
        ]
    }
}

