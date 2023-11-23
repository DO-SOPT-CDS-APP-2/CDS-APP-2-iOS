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
    private let brandmoreIcon = UIImageView()
    
    private let reviewStackView = UIStackView()
    private let reviewnumberLabel = UILabel()
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
    private let usermoreIcon = UIImageView()
    private let userStackView = UIStackView()
    
    
    private let shippingLabel = UILabel()
    private let shippingfeeLabel = UILabel()
    private let shippingfeedescriptLabel = UILabel()
    private let shippingexpectedLabel = UILabel()
    private let shippingdescriptLabel = UILabel()
    
    private let thindivideView1 = UIView()
    private let thindivideView2 = UIView()

    
    private let thickdivideView = UIView()    //height: 8
    private let spacerView = UIView()   //공백

    private let brandImage = UIImageView()
    private let brandNameENLabel = UILabel()
    private let brandNameKRLabel = UILabel()
    private let brandNameStackView = UIStackView()
    
    
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
            
            $0.text = "타입서비스"
        } //타입서비스
        
        brandmoreIcon.do {
            $0.image = #imageLiteral(resourceName: "ic_detail_right_gray_small")
        }
        
        productnameLabel.do {
            $0.textColor = .black
            $0.font = .enDisplayBold(ofSize: 14)
            $0.text = "Typeservice Web Cap [22 Colors]"
        } //Typeservice Web Cap [22 Colors]
        
    
        reviewStackView.do {
            $0.distribution = .equalSpacing
        }
        (1...5).forEach { i in
            let starImageView = UIImageView(image: #imageLiteral(resourceName: "ic_star_black"))
            reviewStackView.addArrangedSubview(starImageView)
        }
        
        reviewnumberLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10)
            
            $0.text = "13266"
        } //13266
        
        reviewdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 10)
            
            $0.text = "개 리뷰보기"
        } //개 리뷰보기
        
        
        priceLabel.do {
            $0.textColor = .lightGray
            $0.text = "39,000원"
        }
        let priceattributedString = NSMutableAttributedString(string: priceLabel.text ?? "")
        priceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 14), range: NSRange(location: 0, length: priceattributedString.length - 1))
        priceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 14), range: NSRange(location: priceattributedString.length - 1, length: 1))
        priceLabel.attributedText = priceattributedString


        discountpercentLabel.do {
            $0.textColor = .point
            $0.font = .enDisplayBold(ofSize: 20)
            $0.text = "5%"
        }
        
        discountpriceLabel.do {
            $0.textColor = .black
            $0.text = "37,050원"
        }
        let discountpriceattributedString = NSMutableAttributedString(string: discountpriceLabel.text ?? "")
        discountpriceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 20), range: NSRange(location: 0, length: discountpriceattributedString.length - 1))
        discountpriceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 20), range: NSRange(location: discountpriceattributedString.length - 1, length: 1))
        discountpriceLabel.attributedText = discountpriceattributedString
        
        
        pointLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10)
            
            $0.text = "371p"
        } //371p
        
        pointpercentLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 12)
            
            $0.text = "(1%)"
        } //(1%)
        
        pointdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 12)
            
            $0.text = "적립"
        } //적립
        
        userLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 12)
            $0.text = "김디팟님 구매 가능 가격"
        }
        let userattributedString = NSMutableAttributedString(string: userLabel.text ?? "")
        userattributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 3))
        userattributedString.addAttribute(.foregroundColor, value: UIColor.mediumGray, range: NSRange(location: 3, length: userattributedString.length - 3))
        userLabel.attributedText = userattributedString
        
        
        userdiscountpercentLabel.do {
            $0.textColor = .mediumGray
            $0.font = .enDisplayBold(ofSize: 16)
            
            $0.text = "12%"
        } //12%
        
        
        userdiscountpriceLabel.do {
            $0.textColor = .black
            $0.text = "34,468원"
        }
        let userdiscountpriceattributedString = NSMutableAttributedString(string: userdiscountpriceLabel.text ?? "")
        userdiscountpriceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 16), range: NSRange(location: 0, length: userdiscountpriceattributedString.length - 1))
        userdiscountpriceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 16), range: NSRange(location: userdiscountpriceattributedString.length - 1, length: 1))
        userdiscountpriceLabel.attributedText = userdiscountpriceattributedString
        
        
        usermoreIcon.do {
            $0.image = #imageLiteral(resourceName: "ic_detail_down_gray_small")
        }
        
        userStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        shippingLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 16)
            $0.text = "배송정보"
        } //배송정보
        
        shippingfeeLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
            $0.text = "배송비"
        } //배송비
        
        shippingfeedescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
            $0.numberOfLines = 0  // 여러 줄 허용
            $0.text = "해당 브랜드 제품은 무료배송 됩니다.\n제주도를 포함한 도서/산간지역은 추가배송비 3,500원"
        }
        
        shippingexpectedLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
            $0.text = "배송예정"
        } //배송예정
        
        shippingdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12)
            $0.text = "2일 이내 출고 (주말, 공휴일 제외)"
        }
        
        let shippingattributedString = NSMutableAttributedString(string: shippingdescriptLabel.text ?? "")
        shippingattributedString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 5))
        shippingattributedString.addAttribute(.foregroundColor, value: UIColor.darkGray, range: NSRange(location: 5, length: shippingattributedString.length - 5))
        shippingdescriptLabel.attributedText = shippingattributedString
        
        for i in [thindivideView1, thindivideView2] {
            i.backgroundColor = .border
        }
        thickdivideView.do {
            $0.backgroundColor = .border
        }
    }
    
    private func setHierachy() {
        contentView.addSubviews(productImage, brandLabel, brandmoreIcon, productnameLabel, reviewStackView, reviewnumberLabel, reviewdescriptLabel, priceLabel, discountpercentLabel, discountpriceLabel, pointLabel, pointpercentLabel, pointdescriptLabel, thindivideView1)

        userStackView.addArrangedSubviews(userLabel)
        userStackView.addArrangedSubview(spacerView)
        userStackView.addArrangedSubviews(userdiscountpercentLabel, userdiscountpriceLabel)
        userStackView.addArrangedSubview(usermoreIcon)
        
        contentView.addSubviews(userStackView, thindivideView2, shippingLabel, shippingfeeLabel, shippingfeedescriptLabel, shippingexpectedLabel, shippingdescriptLabel, thickdivideView)
    }
    
    private func setLayout() {
        productImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(25)
            $0.leading.equalTo(productImage.snp.leading).offset(10)
        }
        
        brandmoreIcon.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.top).offset(1)
            $0.leading.equalTo(brandLabel.snp.trailing).offset(3)
        }
        
        productnameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(10)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        reviewStackView.snp.makeConstraints {
            $0.top.equalTo(productnameLabel.snp.bottom).offset(15)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        reviewnumberLabel.snp.makeConstraints {
            $0.top.equalTo(productnameLabel.snp.bottom).offset(15)
            $0.leading.equalTo(reviewStackView.snp.trailing).offset(5)
        }
        
        reviewdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(reviewnumberLabel)
            $0.leading.equalTo(reviewnumberLabel.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(reviewnumberLabel.snp.bottom).offset(15)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        discountpercentLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        discountpriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountpercentLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(40)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(discountpercentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        pointpercentLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(27)
        }
        
        pointdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(57)
        }
        
        thindivideView1.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.bottom).offset(23)
            $0.bottom.equalTo(pointLabel.snp.bottom).offset(25)

            $0.width.equalTo(contentView.snp.width)
        }
        
        spacerView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        
        userStackView.snp.makeConstraints {
            $0.top.equalTo(thindivideView1.snp.bottom).offset(17)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        thindivideView2.snp.makeConstraints {
            $0.top.equalTo(userStackView.snp.bottom).offset(17)
            $0.bottom.equalTo(userStackView.snp.bottom).offset(19)
            $0.width.equalTo(contentView.snp.width)
        }
        

        shippingLabel.snp.makeConstraints {
            $0.top.equalTo(thindivideView2.snp.bottom).offset(15)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingfeeLabel.snp.makeConstraints {
            $0.top.equalTo(shippingLabel.snp.bottom).offset(10)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingfeedescriptLabel.snp.makeConstraints {
            $0.top.equalTo(shippingfeeLabel)
            $0.leading.equalTo(shippingfeeLabel.snp.trailing).offset(20)
        }
        
        shippingexpectedLabel.snp.makeConstraints {
            $0.top.equalTo(shippingfeeLabel.snp.bottom).offset(35)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(shippingexpectedLabel)
            $0.leading.equalTo(shippingfeedescriptLabel.snp.leading)
        }
        
    
        thickdivideView.snp.makeConstraints {
            $0.top.equalTo(shippingdescriptLabel.snp.bottom).offset(10)
            $0.bottom.equalTo(shippingdescriptLabel.snp.bottom).offset(18)
            $0.width.equalTo(contentView.snp.width)
        }
    }

}


extension UIStackView {
    func addArrangedSubviews(_ labels: UILabel...) {
        labels.forEach { self.addArrangedSubview($0) }
    }
}
