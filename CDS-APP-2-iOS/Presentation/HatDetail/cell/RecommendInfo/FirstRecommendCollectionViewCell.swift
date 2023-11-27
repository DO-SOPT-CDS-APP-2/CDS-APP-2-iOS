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
    private let priceLabel = UILabel()
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
    
    private func setUI() {
        productImage.do {
            $0.image = ImageLiterals.img.imgHatDetail
        }
        
        brandNameKR.do {
            $0.font = .krBold(ofSize: 10.adjusted)
            $0.textColor = .black
            $0.text = "테스트"
        }
        
        brandNameEN.do {
            $0.font = .enDisplayMedium(ofSize: 10.adjusted)
            $0.textColor = .black
            $0.text = "TEST"
        }
        
        priceLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.text = "10% 35,100원"
        }
        let priceString = NSMutableAttributedString(string: priceLabel.text ?? "")
        priceString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 3))
        priceString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 3, length: priceString.length - 3))
        

        priceLabel.attributedText = priceString
        
        
        shippingLabel.do {
            $0.backgroundColor = .background
            $0.text = "무료배송"
            $0.font = .krRegular(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        productStackView.do {
            $0.axis = .vertical
            $0.spacing = 3.adjusted
        }
    }
    
    private func setHierachy() {
        productStackView.addArrangedSubviews(productImage, brandNameKR, brandNameEN, priceLabel, shippingLabel)
        contentView.addSubview(productStackView)
    }
    
    private func setLayout() {
        
        productStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(50)
            $0.width.equalTo(153)
            $0.height.equalTo(253)
        }

    }
    
    func bindData(data: String) {
        self.productImage.image = ImageLiterals.img.imgHatDetail
        self.brandNameEN.text = "TEST"
        self.brandNameKR.text = "테스트"
        self.priceLabel.text = "10% 35,100원"
            
    }

    
}
