//
//  HeaderCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let categoryLabel = UILabel()
    
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
    
    // MARK: - Set UI
    
    private func setUI() {
        categoryLabel.do {
            $0.textColor = .mediumGray
            $0.font = UIFont.krMedium(ofSize: 14.adjusted)
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(categoryLabel)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Methods
    
    func bindData(category: String) {
        categoryLabel.text = category
    }
}
