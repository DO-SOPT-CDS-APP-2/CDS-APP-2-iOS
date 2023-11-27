//
//  MainInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class MainInfoCollectionViewCell: UICollectionViewCell {
    
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
    
    private let topThinDivideView = UIView()
    private let bottomThinDivideView = UIView()

    private let topThickDivideView = UIView()
    private let bottomThickDivideView = UIView()
    private let spacerView = UIView()

    private let brandImage = UIImageView()
    private let brandNameENLabel = UILabel()
    private let brandNameKRLabel = UILabel()
    private let brandNameStackView = UIStackView()
    
    private let detailView = MainInfoDetailView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        productImage.do {
            $0.image = ImageLiterals.img.imgHat
        }
        
        brandLabel.do {
            $0.textColor = .darkGray
            $0.font = .krSemiBold(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.brandKR
        }
        
        brandmoreIcon.do {
            $0.image = ImageLiterals.icon.icDetailRightGray
        }
        
        productnameLabel.do {
            $0.textColor = .black
            $0.font = .enDisplayBold(ofSize: 14.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.productName
        }
        
    
        reviewStackView.do {
            $0.distribution = .equalSpacing
        }
        (1...5).forEach { i in
            let starImageView = UIImageView()
            starImageView.image = ImageLiterals.icon.icStarBlack
            reviewStackView.addArrangedSubview(starImageView)
        }
        
        reviewnumberLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.reviewNumber
        }
        
        reviewdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 10.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.reviewDescript
        }
        
        priceLabel.do {
            $0.textColor = .lightGray
            $0.text = StringLiterals.HatDetail.MainInfo.originPrice
        }
        let priceattributedString = NSMutableAttributedString(string: priceLabel.text ?? "")
        priceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 14.adjusted), range: NSRange(location: 0, length: priceattributedString.length - 1))
        priceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 14.adjusted), range: NSRange(location: priceattributedString.length - 1, length: 1))
        priceLabel.attributedText = priceattributedString

        discountpercentLabel.do {
            $0.textColor = .point
            $0.font = .enDisplayBold(ofSize: 20.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.discountPercent
        }
        
        discountpriceLabel.do {
            $0.textColor = .black
            $0.text = StringLiterals.HatDetail.MainInfo.discountPrice
        }
        let discountpriceattributedString = NSMutableAttributedString(string: discountpriceLabel.text ?? "")
        discountpriceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 20.adjusted), range: NSRange(location: 0, length: discountpriceattributedString.length - 1))
        discountpriceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 20.adjusted), range: NSRange(location: discountpriceattributedString.length - 1, length: 1))
        discountpriceLabel.attributedText = discountpriceattributedString
        
        
        pointLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.point
        }
        
        pointpercentLabel.do {
            $0.textColor = .darkGray
            $0.font = .enDisplayMedium(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.pointPercent
        }
    
        pointdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krMedium(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.pointDescript
        }
        
        userLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.user
        }
        let userattributedString = NSMutableAttributedString(string: userLabel.text ?? "")
        userattributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 3))
        userattributedString.addAttribute(.foregroundColor, value: UIColor.mediumGray, range: NSRange(location: 3, length: userattributedString.length - 3))
        userLabel.attributedText = userattributedString
        
        userdiscountpercentLabel.do {
            $0.textColor = .mediumGray
            $0.font = .enDisplayBold(ofSize: 16.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.userDiscountPercent
        }
        
        userdiscountpriceLabel.do {
            $0.textColor = .black
            $0.text = StringLiterals.HatDetail.MainInfo.userDiscountPrice
        }
        let userdiscountpriceattributedString = NSMutableAttributedString(string: userdiscountpriceLabel.text ?? "")
        userdiscountpriceattributedString.addAttribute(.font, value: UIFont.enDisplayBold(ofSize: 16.adjusted), range: NSRange(location: 0, length: userdiscountpriceattributedString.length - 1))
        userdiscountpriceattributedString.addAttribute(.font, value: UIFont.krBold(ofSize: 16.adjusted), range: NSRange(location: userdiscountpriceattributedString.length - 1, length: 1))
        userdiscountpriceLabel.attributedText = userdiscountpriceattributedString
        
        usermoreIcon.do {
            $0.image = ImageLiterals.icon.icDetailDownGrayMedium
        }
        
        userStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        shippingLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 16.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.shipping
        }
        
        shippingfeeLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.shippigFee
        }
        
        shippingfeedescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.numberOfLines = 0
            $0.text = StringLiterals.HatDetail.MainInfo.shippingFeeDescript
        }
        
        shippingexpectedLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.shippingExpected
        }
        
        shippingdescriptLabel.do {
            $0.textColor = .darkGray
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.shippingDescript
        }
        
        let shippingattributedString = NSMutableAttributedString(string: shippingdescriptLabel.text ?? "")
        shippingattributedString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 5))
        shippingattributedString.addAttribute(.foregroundColor, value: UIColor.darkGray, range: NSRange(location: 5, length: shippingattributedString.length - 5))
        shippingdescriptLabel.attributedText = shippingattributedString
        
        for i in [topThinDivideView, bottomThinDivideView, topThickDivideView, bottomThickDivideView] {
            i.backgroundColor = .background
        }
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(productImage, brandLabel, brandmoreIcon, productnameLabel, reviewStackView, reviewnumberLabel, reviewdescriptLabel, priceLabel, discountpercentLabel, discountpriceLabel, pointLabel, pointpercentLabel, pointdescriptLabel, topThinDivideView)

        userStackView.addArrangedSubviews(userLabel)
        userStackView.addArrangedSubview(spacerView)
        userStackView.addArrangedSubviews(userdiscountpercentLabel, userdiscountpriceLabel)
        userStackView.addArrangedSubview(usermoreIcon)
        
        contentView.addSubviews(userStackView, bottomThinDivideView, shippingLabel, shippingfeeLabel, shippingfeedescriptLabel, shippingexpectedLabel, shippingdescriptLabel, topThickDivideView, detailView, bottomThickDivideView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        productImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(25.adjusted)
            $0.leading.equalTo(productImage.snp.leading).offset(10.adjusted)
        }
        
        brandmoreIcon.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.top).offset(1.adjusted)
            $0.leading.equalTo(brandLabel.snp.trailing).offset(3.adjusted)
        }
        
        productnameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        reviewStackView.snp.makeConstraints {
            $0.top.equalTo(productnameLabel.snp.bottom).offset(15.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        reviewnumberLabel.snp.makeConstraints {
            $0.top.equalTo(productnameLabel.snp.bottom).offset(15.adjusted)
            $0.leading.equalTo(reviewStackView.snp.trailing).offset(5.adjusted)
        }
        
        reviewdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(reviewnumberLabel)
            $0.leading.equalTo(reviewnumberLabel.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(reviewnumberLabel.snp.bottom).offset(15.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        discountpercentLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        discountpriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountpercentLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(40.adjusted)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(discountpercentLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        pointpercentLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(27.adjusted)
        }
        
        pointdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.top)
            $0.leading.equalTo(brandLabel.snp.leading).offset(57.adjusted)
        }
        
        topThinDivideView.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.bottom).offset(23.adjusted)
            $0.bottom.equalTo(pointLabel.snp.bottom).offset(25.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
        
        spacerView.snp.makeConstraints {
            $0.width.equalTo(100.adjusted)
        }
        
        userStackView.snp.makeConstraints {
            $0.top.equalTo(topThinDivideView.snp.bottom).offset(17.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        bottomThinDivideView.snp.makeConstraints {
            $0.top.equalTo(userStackView.snp.bottom).offset(17.adjusted)
            $0.bottom.equalTo(userStackView.snp.bottom).offset(19.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
        

        shippingLabel.snp.makeConstraints {
            $0.top.equalTo(bottomThinDivideView.snp.bottom).offset(15.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingfeeLabel.snp.makeConstraints {
            $0.top.equalTo(shippingLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingfeedescriptLabel.snp.makeConstraints {
            $0.top.equalTo(shippingfeeLabel)
            $0.leading.equalTo(shippingfeeLabel.snp.trailing).offset(20.adjusted)
        }
        
        shippingexpectedLabel.snp.makeConstraints {
            $0.top.equalTo(shippingfeeLabel.snp.bottom).offset(35.adjusted)
            $0.leading.equalTo(brandLabel.snp.leading)
        }
        
        shippingdescriptLabel.snp.makeConstraints {
            $0.top.equalTo(shippingexpectedLabel)
            $0.leading.equalTo(shippingfeedescriptLabel.snp.leading)
        }
        
    
        topThickDivideView.snp.makeConstraints {
            $0.top.equalTo(shippingdescriptLabel.snp.bottom).offset(10.adjusted)
            $0.bottom.equalTo(shippingdescriptLabel.snp.bottom).offset(18.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
        
        detailView.snp.makeConstraints {
            $0.top.equalTo(topThickDivideView.snp.bottom).offset(20.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        bottomThickDivideView.snp.makeConstraints {
            $0.top.equalTo(detailView.snp.bottom).offset(20.adjusted)
            $0.bottom.equalTo(detailView.snp.bottom).offset(28.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
    }
}


extension UIStackView {
    func addArrangedSubviews(_ labels: UILabel...) {
        labels.forEach { self.addArrangedSubview($0) }
    }
}
