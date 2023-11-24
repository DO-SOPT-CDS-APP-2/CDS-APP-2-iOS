//
//  ProductInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

class ProductInfoCollectionViewCell: UICollectionViewCell {
    
    private let hatImage = UIImageView()
    private let hatmodelImage = UIImageView()
    private let productdescriptmoreButton = UIButton()
    private let thickdivideView = UIView()
    
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
         
        hatImage.do {
            $0.image = ImageLiterals.img.imgHat2
        }
        
        hatmodelImage.do {
            $0.image = ImageLiterals.img.imgHatModel
        }
        
        productdescriptmoreButton.do {
            $0.setTitle(StringLiterals.HatDetail.ProductInfo.productdescriptmore, for: .normal)
            $0.setTitleColor(.mediumGray, for: .normal)
            $0.titleLabel?.font = .krMedium(ofSize: 14.adjusted)
            $0.layer.borderColor = UIColor.mediumGray.cgColor
            $0.layer.borderWidth = 1
        }
        
        thickdivideView.do {
            $0.backgroundColor = .border
        }
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(hatImage, hatmodelImage, productdescriptmoreButton, thickdivideView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        hatImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        hatmodelImage.snp.makeConstraints {
            $0.top.equalTo(hatImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        productdescriptmoreButton.snp.makeConstraints {
            $0.top.equalTo(hatmodelImage.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(56.adjusted)
        }
        
        thickdivideView.snp.makeConstraints {
            $0.top.equalTo(productdescriptmoreButton.snp.bottom).offset(10.adjusted)
            $0.bottom.equalTo(productdescriptmoreButton.snp.bottom).offset(18.adjusted)
        }
    }
}
