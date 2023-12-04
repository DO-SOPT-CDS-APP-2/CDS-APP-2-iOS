//
//  ListCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

import SnapKit
import Then

final class ListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private let etcLabel = UILabel()
    private let thinDivideView = UIView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set UI
    
    private func setUI() {
        etcLabel.do {
            $0.font = .krBold(ofSize: 16.adjusted)
            $0.textColor = .black
        }
        
        thinDivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(etcLabel,
                                thinDivideView)
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        etcLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        thinDivideView.snp.makeConstraints {
            $0.top.equalTo(etcLabel.snp.bottom).offset(5.adjusted)
            $0.height.equalTo(1.adjusted)
            $0.width.equalTo(335.adjusted)
        }
    }
    
    func bindData(item: InquireList) {
        etcLabel.text = item.label
    }
    
}
