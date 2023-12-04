//
//  RecommendInfoHeaderCollectionReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

import SnapKit
import Then

// MARK: - 추천 Section - StickHeader

final class RecommendInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - set Properties
    
    private let productInfoLabel = UILabel()
    private let sizeLabel = UILabel()
    private let recommendLabel = UILabel()
    private let reviewLabel = UILabel()
    private let inquireLabel = UILabel()
    private let selectlineView = UIView()
    private let selectStackView = UIStackView()
    private let headerStackView = UIStackView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .white
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    // MARK: - set UI
    
    func setUI() {
        productInfoLabel.do {
            $0.text = StringLiterals.HatDetail.header.productInfo
        }
        
        selectlineView.do {
            $0.backgroundColor = .black
        }
        
        selectStackView.do {
            $0.axis = .vertical
        }
        
        sizeLabel.do {
            $0.text = StringLiterals.HatDetail.header.size
        }
        
        recommendLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 14.adjusted)
            $0.text = StringLiterals.HatDetail.header.recommend
            $0.textAlignment = .center
        }
        
        reviewLabel.do {
            $0.text = StringLiterals.HatDetail.header.review
        }
        
        inquireLabel.do {
            $0.text = StringLiterals.HatDetail.header.inquire
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
        }
        
        [productInfoLabel, sizeLabel, reviewLabel, inquireLabel].forEach {
            $0.sizeToFit()
            $0.font = .krBold(ofSize: 14.adjusted)
            $0.textColor = .lightGray
        }
    }
    
    
    // MARK: - Set Hierachy
    
    func setHierachy() {
        selectStackView.addArrangedSubviews(recommendLabel,
                                            selectlineView)
        
        headerStackView.addArrangedSubviews(productInfoLabel,
                                            sizeLabel,
                                            selectStackView,
                                            reviewLabel,
                                            inquireLabel)

        addSubview(headerStackView)
    }
    
    // MARK: - Set Layout
    
    func setLayout() {
        
        selectlineView.snp.makeConstraints {
            $0.width.equalTo(63.adjusted)
            $0.height.equalTo(1.adjusted)
            $0.leading.equalTo(recommendLabel.snp.leading).inset(5.adjusted)
            
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30.adjusted)
            $0.height.equalTo(45.adjusted)
        }
    }
}
