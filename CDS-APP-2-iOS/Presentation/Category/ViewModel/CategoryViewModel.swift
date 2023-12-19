//
//  CategoryViewModel.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/12/18.
//

import UIKit

final class ImplementCategoryViewModel: NSObject {
    let categoryModel: Observable<[Category]> = Observable([
                        Category(image: ImageLiterals.img.imgCollect, label: "모아보기"),
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
                        Category(image: ImageLiterals.img.imgSpecialOrder, label: "스페셜오더")])
    
    let categoryListModel: Observable<[CategoryList]> = Observable([
                        CategoryList(label: "의류"),
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
                        CategoryList(label: "컬처")])
    
    let categoryDetailListModel: Observable<[CategoryDetailList]> = Observable([
                        CategoryDetailList(label: "전체"),
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
                        CategoryDetailList(label: "해외브랜드")])
}
