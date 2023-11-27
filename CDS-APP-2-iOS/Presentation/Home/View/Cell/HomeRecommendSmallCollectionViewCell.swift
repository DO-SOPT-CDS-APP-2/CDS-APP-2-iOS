//
//  HomeRecommendSmallCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/25.
//

import UIKit

import SnapKit
import Then

final class HomeRecommendSmallCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let recommendImageView = UIImageView()
    private let recommendLabel = UILabel()
    private let arrowImageView = UIImageView(image: ImageLiterals.icon.icDetail)
    private lazy var recommendStackView = UIStackView(arrangedSubviews: [recommendImageView,
                                                                         recommendLabel,
                                                                         arrowImageView])
    
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
        self.do {
            $0.setRoundBorder(borderColor: .border,
                              borderWidth: 1,
                              cornerRadius: 21.15)
        }
        
        recommendStackView.do {
            $0.axis = .horizontal
            $0.spacing = 12.adjusted
            $0.alignment = .center
        }
        
        recommendLabel.do {
            $0.font = .krMedium(ofSize: 12.adjusted)
            $0.textColor = .black
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(recommendStackView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        recommendStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(6.adjusted)
        }
        recommendImageView.snp.makeConstraints {
            $0.height.width.equalTo(33.adjusted)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.height.width.equalTo(20.adjusted)
        }
    }
    
    func configureCell(data: RecommendSmallCellData) {
        recommendImageView.image = data.image
        recommendLabel.text = data.text
    }
}
