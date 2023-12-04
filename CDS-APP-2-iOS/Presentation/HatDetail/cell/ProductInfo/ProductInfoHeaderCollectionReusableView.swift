//
//  ProductInfoHeaderCollectionReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/22.
//

import UIKit

import SnapKit
import Then

final class ProductInfoHeaderCollectionReusableView: UICollectionReusableView {
    
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
        setUI()
        setHierachy()
        setLayout()
    }
    
    // MARK: - set UI
    
    func setUI() {
        backgroundColor = .white
        
        productInfoLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 14.adjusted)
            $0.text = StringLiterals.HatDetail.header.productInfo
            $0.textAlignment = .center
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
            $0.text = StringLiterals.HatDetail.header.recommend
        }
        
        reviewLabel.do {
            $0.text = StringLiterals.HatDetail.header.review
        }
        
        inquireLabel.do {
            $0.text = StringLiterals.HatDetail.header.inquire
        }
        
        [sizeLabel, recommendLabel, reviewLabel, inquireLabel].forEach {
            $0.textColor = .lightGray
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
    }
    
    
    // MARK: - set Hierachy
    
    func setHierachy() {
        selectStackView.addArrangedSubviews(productInfoLabel,
                                            selectlineView)
        
        headerStackView.addArrangedSubview(selectStackView)
        
        headerStackView.addArrangedSubviews(sizeLabel,
                                            recommendLabel,
                                            reviewLabel,
                                            inquireLabel)

        addSubview(headerStackView)
    }
    
    // MARK: - set Layout
    
    func setLayout() {
        selectlineView.snp.makeConstraints {
            $0.width.equalTo(63.adjusted)
            $0.height.equalTo(1.adjusted)
            $0.leading.equalTo(productInfoLabel.snp.leading).inset(5.adjusted)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30.adjusted)
            $0.height.equalTo(45.adjusted)
        }
    } 
    
}
