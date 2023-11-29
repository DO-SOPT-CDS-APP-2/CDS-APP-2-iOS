//
//  ListCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

import SnapKit
import Then

class ListCollectionViewCell: UICollectionViewCell {
    
    private let etcLabel = UILabel()
    private let thinDivideView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {

        etcLabel.do {
            $0.font = .krBold(ofSize: 16.adjusted)
            $0.textColor = .black
        }
        
        thinDivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    private func setHierachy() {
        contentView.addSubviews(etcLabel, thinDivideView)
    }
    
    private func setLayout() {
        etcLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        thinDivideView.snp.makeConstraints {
            $0.top.equalTo(etcLabel.snp.bottom).offset(5.adjusted)
            $0.bottom.equalTo(etcLabel.snp.bottom).offset(6.adjusted)
            $0.width.equalTo(335.adjusted)
        }
    }
    
    func bindData(item: InquireList) {
        etcLabel.text = item.label
    }
    
}
