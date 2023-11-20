//
//  CategoryTableHeaderView.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class CategoryTableHeaderView: UIView {
    
    private let womenButton = UIButton()
    private let menButton = UIButton()
    private let adImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        womenButton.do {
            $0.setTitle(StringLiterals.category.tableViewHeader.women, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 15.adjusted
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1.15.adjusted
        }
        
        menButton.do {
            $0.setTitle(StringLiterals.category.tableViewHeader.men, for: .normal)
            $0.setTitleColor(.lightGray, for: .normal)
            $0.titleLabel?.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 15.adjusted
            $0.layer.borderColor = UIColor.border.cgColor
            $0.layer.borderWidth = 1.15.adjusted
        }
        
        adImage.do {
            $0.image = ImageLiterals.img.imgLoveMeMonster
        }
    }
    
    private func setHierachy() {
        self.addSubviews(womenButton,
                         menButton,
                         adImage)

    }
    
    private func setLayout() {
        womenButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13.adjusted)
            $0.leading.equalToSuperview().inset(18.adjusted)
            $0.width.equalTo(82.adjusted)
            $0.height.equalTo(30.adjusted)
        }
        
        menButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13.adjusted)
            $0.leading.equalTo(womenButton.snp.trailing).offset(10.adjusted)
            $0.width.equalTo(60.adjusted)
            $0.height.equalTo(30.adjusted)
        }
        
        adImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58.adjusted)
            $0.leading.equalToSuperview().inset(14.adjusted)
            $0.trailing.equalToSuperview().inset(17.adjusted)
            $0.height.equalTo(115.adjusted)
        }
    }
}
