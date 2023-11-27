//
//  HomeRecommendBigCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/25.
//

import UIKit

import SnapKit
import Then

final class HomeRecommendBigCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Components
    
    private let bigCellImageView = UIImageView(image: ImageLiterals.img.imgHome1)
    private let onlyLabel = UILabel()
    private let qurationLabel = UILabel()
    private let arrowImageView = UIImageView(image: ImageLiterals.icon.icDetail)
    private lazy var labelStackView = UIStackView(arrangedSubviews: [onlyLabel,
                                                                     qurationLabel])
    private lazy var totalStackView = UIStackView(arrangedSubviews: [bigCellImageView,
                                                                     labelStackView,
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
        
        onlyLabel.do {
            $0.font = .krBold(ofSize: 14.adjusted)
            $0.textColor = .black
            $0.text = StringLiterals.Home.secondSection.only
        }
        
        qurationLabel.do {
            $0.font = .krMedium(ofSize: 12.adjusted)
            $0.textColor = .darkGray
            $0.text = StringLiterals.Home.secondSection.quration
            $0.asColor(targetString: "D-4",
                       color: .point,
                       font: .enDisplayMedium(ofSize: 12.adjusted))
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 7.adjusted
        }
        
        totalStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10.adjusted
            $0.alignment = .center
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(totalStackView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(94.adjusted)
        }
        
        bigCellImageView.snp.makeConstraints {
            $0.height.width.equalTo(61.54.adjusted)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.height.width.equalTo(20.adjusted)
        }
        
        totalStackView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.leading.equalToSuperview().inset(14.42.adjusted)
        }
    }
}
