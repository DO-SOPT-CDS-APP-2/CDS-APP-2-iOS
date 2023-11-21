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
            $0.font = .krRegular(ofSize: 12)
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
            $0.top.equalTo(categoryImage.snp.bottom).offset(8.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCell(category: Category) {
        categoryImage.image = category.image
        categoryLabel.text = category.label
    }
}
