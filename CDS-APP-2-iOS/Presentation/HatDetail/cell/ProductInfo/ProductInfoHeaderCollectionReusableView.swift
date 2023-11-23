//
//  ProductInfoHeaderCollectionReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/22.
//

import UIKit

import SnapKit
import Then

class ProductInfoHeaderCollectionReusableView: UICollectionReusableView {
    

    
    private let productInfoLabel = UILabel()
    private let sizeLabel = UILabel()
    private let recommendLabel = UILabel()
    private let reviewLabel = UILabel()
    private let inquireLabel = UILabel()
    private let selectlineView = UIView()
    
    private let selectStackView = UIStackView()
    private let headerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        setUI()
        setLayout()
        setHierachy()
    }
    
    // MARK: - Set UI
    
    func setUI() {
        productInfoLabel.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        selectlineView.do {
            $0.backgroundColor = .black
        }
        
        selectStackView.do {
            $0.axis = .vertical
            $0.spacing = 3
        }
        
        sizeLabel.do {
            $0.textColor = .lightGray
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        recommendLabel.do {
            $0.textColor = .lightGray
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        reviewLabel.do {
            $0.textColor = .lightGray
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        inquireLabel.do {
            $0.textColor = .lightGray
            $0.font = .krBold(ofSize: 14.adjusted)
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
    }
    
    
    // MARK: - Set Hierachy
    
    func setHierachy() {
        selectStackView.addArrangedSubview(productInfoLabel)
        selectStackView.addArrangedSubview(selectlineView)
        headerStackView.addArrangedSubview(selectStackView)
        headerStackView.addArrangedSubviews(sizeLabel, recommendLabel, reviewLabel, inquireLabel)

        addSubview(headerStackView)
    }
    
    
    // MARK: - Set Layout
    
    func setLayout() {
        selectlineView.snp.makeConstraints {
            $0.width.equalTo(67)
            $0.height.equalTo(1)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.leading.equalToSuperview().inset(30.adjusted)
            $0.trailing.equalToSuperview().inset(30.adjusted)
        }
    } 
    
}
