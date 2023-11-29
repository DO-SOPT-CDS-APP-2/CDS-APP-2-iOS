//
//  DetailProductCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/29/23.
//

import UIKit

final class DetailProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - set Properties
    
    private let productImageView = UIImageView()
    private let hearticonImageView = UIImageView()
    private let starIconImageView = UIImageView()
    
    private let brandName = UILabel()
    private let productName = UILabel()
    private let salePercent = UILabel()
    private let productPrice = UILabel()
    
    private let freeDelivery = FreeDelieveryChipView()
    private let heartNumber = UILabel()
    private let starRate = UILabel()
    private let starNumber = UILabel()
    private let likedButton = UIButton()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set UI
    
    private func setUI() {
        brandName.do {
            $0.font = UIFont.krBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        productName.do {
            $0.font = UIFont.enDisplayMedium(ofSize: 10.adjusted)
            $0.lineBreakMode = .byWordWrapping
            $0.numberOfLines = 2
        }
        
        salePercent.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .point
        }
        
        productPrice.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.contentView.addSubviews(productImageView,
                                     brandName,
                                     productName,
                                     salePercent,
                                     productPrice,
                                     freeDelivery)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.size.equalTo(187.adjusted)
        }
        
        brandName.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
        }
        
        productName.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(7.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.width.equalTo(150.adjusted)
        }
        
        salePercent.snp.makeConstraints {
            $0.top.equalTo(productName.snp.bottom).offset(9.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
        }
        
        productPrice.snp.makeConstraints {
            $0.top.equalTo(productName.snp.bottom).offset(9.adjusted)
            $0.leading.equalTo(salePercent.snp.trailing).offset(4.adjusted)
        }
        
        freeDelivery.snp.makeConstraints {
            $0.top.equalTo(salePercent.snp.bottom).offset(7.adjusted)
            $0.leading.equalToSuperview().offset(12.adjusted)
            $0.width.equalTo(43.adjusted)
            $0.height.equalTo(18.adjusted)
        }
    }
    
    //MARK: - Methods
    
    func bindData(detailProduct: DetailProduct) {
        productImageView.image = detailProduct.productImage
        brandName.text = detailProduct.brandName
        productName.text = detailProduct.productName
        salePercent.text = "\(detailProduct.salePercent)%"
        productPrice.text = "\(detailProduct.productPrice)"
    }
}
