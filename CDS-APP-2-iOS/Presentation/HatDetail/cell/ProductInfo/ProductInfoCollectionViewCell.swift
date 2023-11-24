//
//  ProductInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

class ProductInfoCollectionViewCell: UICollectionViewCell {
    
    private let hatImage = UIImageView()
    private let hatmodelImage = UIImageView()
    
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
        hatImage.do {
            $0.image = ImageLiterals.img.imgHat2
        }
        
        hatmodelImage.do {
            $0.image = ImageLiterals.img.imgHatModel
        }
    }
    
    
    private func setHierachy() {
        contentView.addSubviews(hatImage, hatmodelImage)
    }
    
    
    private func setLayout() {
        
        hatImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        
    }
    
    
}
