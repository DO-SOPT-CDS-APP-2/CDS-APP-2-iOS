//
//  MainInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then


class MainInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MainInfoCollectionViewCell"
    private let productImage = UIImageView()
    
    private let likebutton = UIButton()
    private let brandLabel = UILabel()
    private let productnameLabel = UILabel()
    //private let brandmoreIcon = UIImageView()
    
    private let reviewImage = UIImageView()
    private let reviewnumberLaebl = UILabel()
    private let reviewdescriptLabel = UILabel()
    
    private let priceLabel = UILabel()
    private let discountpercentLabel = UILabel()
    private let discountpriceLabel = UILabel()
    private let pointLabel = UILabel()
    private let pointpercentLabel = UILabel()
    private let pointdescriptLabel = UILabel()
    
    private let userLabel = UILabel()
    private let userdescriptLabel = UILabel()
    private let userdiscountpercentLabel = UILabel()
    private let userdiscountpriceLabel = UILabel()
    private let userstackView = UIStackView()
    
    
    private let shippingLabel = UILabel()
    private let shippingfeeLabel = UILabel()
    private let shippingfeedescriptLabel = UILabel()
    private let shippingexpectedLabel = UILabel()
    private let shippingdescriptLabel = UILabel()
    
    private let thindivideView = UIView()    //height: 1
    private let thickdivideView = UIView()    //height: 8
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        productImage.do {
            $0.image = #imageLiteral(resourceName: "img_hat")
        }
        
        brandLabel.do {
            $0.textColor = .darkGray
            $0.font = .krSemiBold(ofSize: 12)
        } //타입서비스
        
        productnameLabel.do {
            $0.textColor = .black
            $0.font = .enDisplayBold(ofSize: 14)
        } //Typeservice Web Cap [22 Colors]
        
        reviewnumberLaebl.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10)
        } //13266
        
        reviewdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 10)
        } //개 리뷰보기
        
        priceLabel.do {
            $0.textColor = .lightGray
            $0.font = .enDisplayBold(ofSize: 14)
        } //정가 : 39,000
        
        discountpercentLabel.do {
            $0.textColor = .point
            $0.font = .enDisplayBold(ofSize: 20)
        } //5%
        
        discountpriceLabel.do {
            $0.textColor = .black
            $0.font = .enDisplayBold(ofSize: 20)
        } //37,050
        
        pointLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10)
        } //371p
        
        pointpercentLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 12)
        } //(1%)
        
        pointdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 12)
        } //적립
        
        userLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 12)
        } //김디팟
        
        userdescriptLabel.do {
            $0.textColor = .mediumGray
            $0.font = .krBold(ofSize: 12)
        } //님 구매 가능 가격
        
        userdiscountpercentLabel.do {
            $0.textColor = .mediumGray
            $0.font = .enDisplayBold(ofSize: 16)
        } //12%
        
        userdiscountpriceLabel.do {
            $0.textColor = .black
            $0.font = .enDisplayBold(ofSize: 16)
        } //34,468
        
        
        shippingLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 16)
        } //배송정보
        
        shippingfeeLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
        } //배송비
        
        shippingfeedescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
        } //해당 브랜드 제품은 무료배송 됩니다 ~~~~
        
        shippingexpectedLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
        } //배송예정
        
        shippingdescriptLabel.do {
            $0.textColor = .point
            $0.font = .krRegular(ofSize: 12)
        } //2일 이내 출고 -> 색상 나눠야 함
        
        
        thindivideView.do {
            $0.backgroundColor = .border
        }
        
        thickdivideView.do {
            $0.backgroundColor = .border
        }
        
    }
    
    private func setHierachy() {
        contentView.addSubviews(productImage, productnameLabel)
    }
    
    private func setLayout() {
        productImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        productnameLabel.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(10)
            $0.leading.equalTo(productImage.snp.leading)
        }
        
        
        
        
    }
}
