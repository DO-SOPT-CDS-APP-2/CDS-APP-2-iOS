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
    
    enum HatDetail {
        enum MainInfo {
            static let brandKR = "타입서비스"
            static let productname = "Typeservice Web Cap [22 Colors]"
            static let reviewnumber = "13266"
            static let reviewdescript = "개 리뷰보기"
            static let originprice = "39,000원"
            static let discountpercent = "5%"
            static let discountprice = "37,050원"
            static let point = "371p"
            static let pointpercent = "(1%)"
            static let pointdescript = "적립"
            static let user = "김디팟님 구매 가능 가격"
            static let userdiscountpercent = "12%"
            static let userdiscountprice = "34,468원"
            static let shipping = "배송정보"
            static let shippigfee = "배송비"
            static let shippingfeedescript = "해당 브랜드 제품은 무료배송 됩니다.\n제주도를 포함한 도서/산간지역은 추가배송비 3,500원"
            static let shippingexpected = "배송예정"
            static let shippingdescript = "2일 이내 출고 (주말, 공휴일 제외)"
            
        }
    }
}
