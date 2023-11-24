//
//  HomeCardCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/24.
//

import UIKit

import SnapKit
import Then

final class HomeCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let cardImageView = UIImageView(image: ImageLiterals.img.imgHomeCard)
    
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
        self.backgroundView = UIImageView(image: ImageLiterals.img.imgHomeBackground)
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(cardImageView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        cardImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(446.adjusted)
            $0.width.equalTo(334.adjusted)
        }
    }
}

