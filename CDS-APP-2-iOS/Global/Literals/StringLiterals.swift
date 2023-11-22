//
//  StringLiterals.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import Foundation

enum StringLiterals {
    enum category {
        enum header {
            static let searchBarPlaceHolder = "당일 출고 단독 아이템 컬렉션"
        }
        
        enum tableViewHeader {
            static let women = "WOMEN"
            static let men = "MEN"
        }
    }
    
    enum Tabbar {
        enum title{
            static let home = "HOME"
            static let category = "CATEGORY"
            static let search = "SEARCH"
            static let like = "LIKE"
            static let my = "MY"
        }
    }
    
    enum hatCategory {
        enum header {
            static let all = "전체"
            static let beanie = "비니"
            static let ballCap = "볼캡"
            static let bucketHat = "버킷햇"
            static let balaclava = "바라클라바"
            static let beret = "베레모"
            static let trapper = "트루퍼"
            static let fedora = "페도라"
        }
    }
}
