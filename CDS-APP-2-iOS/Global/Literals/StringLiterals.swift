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
            static let brandEN = "typeservice"
            static let productName = "Typeservice Web Cap [22 Colors]"
            static let reviewNumber = "13266"
            static let reviewDescript = "개 리뷰보기"
            static let originPrice = "39,000원"
            static let discountPercent = "5%"
            static let discountPrice = "37,050원"
            static let point = "371p"
            static let pointPercent = "(1%)"
            static let pointDescript = "적립"
            static let user = "김디팟님 구매 가능 가격"
            static let userDiscountPercent = "12%"
            static let userDiscountPrice = "34,468원"
            static let shipping = "배송정보"
            static let shippigFee = "배송비"
            static let shippingFeeDescript = "해당 브랜드 제품은 무료배송 됩니다.\n제주도를 포함한 도서/산간지역은 추가배송비 3,500원"
            static let shippingExpected = "배송예정"
            static let shippingDescript = "2일 이내 출고 (주말, 공휴일 제외)"
            static let likeCount = "50908"
            
        }
        
        enum header {
            static let productInfo = "상품정보"
            static let size = "사이즈"
            static let recommend = "추천"
            static let review = "리뷰"
            static let inquire = "문의"
        }
        
        enum ProductInfo {
            static let productDescriptMore = "상품설명 더보기"
        }
    }
            
    enum HatCategory {
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
  
    enum Home {
        enum chip {
            static let woman = "우먼"
            static let man = "맨"
            static let life = "라이프"
            static let best = "베스트"
            static let recommand = "추천"
        }
        
        enum secondSection {
            static let only = "오직 김디팟님만 볼 수 있어요"
            static let quration = "큐레이션 종료까지 D-4 13:00:33"
            static let winter = "겨울 캐주얼 신상품"
            static let jewelry = "핫한 트렌드 주얼리"
            static let best = "MD 추천 베스트 브랜드"
            static let present = "센스있는 선물하기"
        }
    }
}
