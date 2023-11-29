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
        
        enum SizeInfo {
            static let one = "1"
            static let two = "2"
            static let three = "3"
            static let headCircumference = "머리둘레"
            static let depth = "깊이"
            static let brimLength = "챙길이"
            static let free = "FREE"
            static let cm = "CM"
            static let headCircumferenceSize = "58"
            static let depthSize = "16.5"
            static let brimLengthSize = "7.5"
            static let realSize = "실측 사이즈"
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
        
        enum main {
            enum realtimeBest {
                enum product1 {
                    static let name = "타입서비스"
                    static let salePercent = "5%"
                    static let price = "37,050"
                }
                enum product2 {
                    static let name = "슬리피슬립"
                    static let salePercent = "10%"
                    static let price = "52,200"
                }
                enum product3 {
                    static let name = "론론"
                    static let salePercent = "15%"
                    static let price = "140,250"
                }
                enum product4 {
                    static let name = "시엔느"
                    static let salePercent = "5%"
                    static let price = "45,000"
                }
            }
            
            enum filter {
                static let recommend = "추천순"
                static let color = "색상"
                static let priceRange = "가격대"
                static let productInfo = "상품정보"
                static let brand = "브랜드"
            }
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
        
        enum thirdSection {
            static let headerTitle = "노티아의 겨울 추천 코디"
            static let headerSubTitle = "노티아와 크리에이터 디팟이 추천합니다. 올 겨울 코디하기 좋은\n다양한 룩을 준비했어요."
            static let notia = "노티아"
            static let firstCellSubtitle = "MERINO WOOL ROUND CARDIGAN - RED"
            static let secondCellSubtitle = "LUNA BALMACAN HANDMADE COAT - BEIGE"
            static let tenPercent = "10%"
            static let firstCellPrice = "106,200"
            static let secondCellPrice = "282,600"
        }
        
        enum fourthSection {
            static let header = "김디팟님을 위한 추천 상품"
            static let footer = "추천상품 전체보기"
            static let firstTitle = "플레이스 스튜디오"
            static let firstDiscount = "20%"
            static let firstPrice = "62,400"
            static let secondTitle = "시엔느"
            static let secondDiscount = "10%"
            static let secondPrice = "53,000"
            static let thirdTitle = "승연이의집"
            static let thirdDiscount = "53%"
            static let thirdPrice = "39,800"
        }
    }
}
