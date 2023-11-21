//
//  CategoryHorizontalCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class CategoryHorizontalCollectionViewCell: UICollectionViewCell {
    
    private let categoryImage = UIImageView()
    private let categoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        categoryLabel.do {
            $0.textColor = .black
        }
    }
    
    private func setHierachy() {
        self.addSubviews(categoryImage, categoryLabel)
    }
    
    private func setLayout() {
        categoryImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(54.adjusted)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCell(category: Category) {
        categoryImage.image = category.image
        categoryLabel.text = category.label
        for string in category.label.unicodeScalars {
            // ASCII 범위 (영어)
            if string.value >= 65 && string.value <= 122 {
                categoryLabel.font = .enDisplayMedium(ofSize: 10)
                categoryLabel.snp.remakeConstraints {
                    $0.bottom.equalToSuperview().inset(3.adjusted)
                    $0.centerX.equalToSuperview()
                }
            }
            // ASCII 범위 (한글)
            if string.value >= 44032 && string.value <= 55215 {
                categoryLabel.font = .krRegular(ofSize: 12)
                categoryLabel.snp.remakeConstraints {
                    $0.bottom.equalToSuperview()
                    $0.centerX.equalToSuperview()
                }
            }
        }
    }
}
