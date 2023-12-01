//
//  ProductInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class ProductInfoCollectionViewCell: UICollectionViewCell {
    
    private let hatImage = UIImageView()

    private let productdescriptmoreButton = UIButton()
    private let thickDivideView = UIView()
    
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
        
      
        
        productdescriptmoreButton.do {
            $0.setTitle(StringLiterals.HatDetail.ProductInfo.productDescriptMore, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .krMedium(ofSize: 14.adjusted)
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
        
        thickDivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(hatImage, productdescriptmoreButton, thickDivideView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        hatImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        productdescriptmoreButton.snp.makeConstraints {
            $0.top.equalTo(hatImage.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(56.adjusted)
        }
        
        thickDivideView.snp.makeConstraints {
            $0.top.equalTo(productdescriptmoreButton.snp.bottom).offset(17.adjusted)
            $0.bottom.equalTo(productdescriptmoreButton.snp.bottom).offset(25.adjusted)
            $0.width.equalTo(contentView.snp.width)
        }
    }
    
    // 작업끝 ❤️
    func bindData(item: DataClass?) {
        guard let item else { return }
        hatImage.kfSetImage(url: item.description)

    }
}
