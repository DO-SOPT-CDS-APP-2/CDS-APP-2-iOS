//
//  FirstDetailCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

final class FirstDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private let productImage = UIImageView()
    private let brandNameEN = UILabel()
    private let brandNameKR = UILabel()
    private let salePercentLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceStackView = UIStackView()
    private let shippingLabel = UILabel()
    private let productStackView = UIStackView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - set UI
    
    private func setUI() {
        brandNameKR.do {
            $0.font = .krBold(ofSize: 10.adjusted)
        }
        
        brandNameEN.do {
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
        }
        
        salePercentLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.textColor = .point
        }
        priceLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 1
        }
        
        shippingLabel.do {
            $0.text = "무료배송"
            $0.font = .krRegular(ofSize: 10.adjusted)
        }
        
        productStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        
        [brandNameKR, brandNameEN, priceLabel, shippingLabel].forEach {
            $0.textColor = .black
        }
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        priceStackView.addArrangedSubviews(salePercentLabel,
                                           priceLabel)
        
        productStackView.addArrangedSubviews(productImage,
                                             brandNameKR,
                                             brandNameEN,
                                             priceStackView,
                                             shippingLabel)
        
        contentView.addSubview(productStackView)
    }
    
    // MARK: - set Layout
    
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
