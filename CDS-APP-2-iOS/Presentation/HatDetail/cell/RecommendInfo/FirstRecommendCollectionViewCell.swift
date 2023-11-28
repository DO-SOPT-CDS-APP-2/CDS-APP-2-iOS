//
//  FirstRecommendCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

import SnapKit
import Then

class FirstRecommendCollectionViewCell: UICollectionViewCell {
    private let productImage = UIImageView()
    private let brandNameEN = UILabel()
    private let brandNameKR = UILabel()
    private let salePercentLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceStackView = UIStackView()
    private let shippingLabel = UILabel()
    private let productStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Set UI
    
    private func setUI() {
        brandNameKR.do {
            $0.font = .krBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        brandNameEN.do {
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        salePercentLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.textColor = .point
        }
        priceLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 1
        }
        
        shippingLabel.do {
            $0.backgroundColor = .background
            $0.text = "무료배송"
            $0.font = .krRegular(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        productStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        priceStackView.addArrangedSubviews(salePercentLabel, priceLabel)
        productStackView.addArrangedSubviews(productImage, brandNameKR, brandNameEN, priceStackView, shippingLabel)
        contentView.addSubview(productStackView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        salePercentLabel.snp.makeConstraints {
            $0.width.equalTo(24.adjusted)
        }
        priceLabel.snp.makeConstraints {
            $0.width.equalTo(48.adjusted)
        }
        productStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(50.adjusted)
            $0.width.equalTo(153.adjusted)
            $0.height.equalTo(253.adjusted)
        }
    }

    
    func bindData(item: RecommendItem) {
        productImage.image = item.image
        brandNameEN.text = item.brandNameEN
        brandNameKR.text = item.brandNameKR
        salePercentLabel.text = item.salePercent
        priceLabel.text = item.price
    }
}
