//
//  HomePromotionHeaderView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

import SnapKit
import Then

final class HomePromotionReusableView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let bannerImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private lazy var labelStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 
    
    private func setUI() {
        titleLabel.do {
            $0.font = .krBold(ofSize: 20.adjusted)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
        subTitleLabel.do {
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.textColor = .black
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 7.69.adjusted
            $0.alignment = .leading
        }
    }
        
    private func setHierachy() {
        self.addSubviews(bannerImageView,
                         labelStackView)
    }
    
    private func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.height.equalTo(338.adjusted)
            $0.width.centerX.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(20.adjusted)
        }
        
        labelStackView.snp.makeConstraints {
            $0.width.leading.equalToSuperview()
            $0.top.equalTo(bannerImageView.snp.bottom).offset(19.adjusted)
        }
    }
    
    func configureHeader(data: PromotionHeaderData) {
        bannerImageView.image = data.bannerImage
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
}
