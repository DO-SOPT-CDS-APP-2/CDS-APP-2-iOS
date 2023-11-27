//
//  MainInfoDetailView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/26.
//

import UIKit

import SnapKit
import Then

// MARK: - MainInfo Cell Datail View

final class MainInfoDetailView: UIView {

    // MARK: - Conponents
    
    private let hatdetailImage = UIImageView()
    private let brandnameEN = UILabel()
    private let brandnameKR = UILabel()
    private let moreIcon = UIImageView()
    private let brandnameStackView = UIStackView()
    private let likeIcon = UIImageView()
    private let likecount = UILabel()
    private let likeStackView = UIStackView()

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
        self.backgroundColor = .white
        
        hatdetailImage.do {
            $0.image = ImageLiterals.img.imgHatDetail
        }
        
        brandnameEN.do {
            $0.font = .enDisplayBold(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.brandEN
            $0.textColor = .darkGray
        }
        
        moreIcon.do {
            $0.image = ImageLiterals.icon.icDetailRightGraySmall
        }
        
        brandnameKR.do {
            $0.font = .krRegular(ofSize: 12.adjusted)
            $0.text = StringLiterals.HatDetail.MainInfo.brandKR
            $0.textColor = .darkGray
        }
        
        brandnameStackView.do {
            $0.axis = .vertical
            $0.spacing = 7.adjusted
        }
        
        likeIcon.do {
            $0.image = ImageLiterals.icon.icLikeOffGrayBig
        }
        
        likecount.do {
            $0.text = StringLiterals.HatDetail.MainInfo.likeCount
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
            $0.textColor = .mediumGray
        }
        
        likeStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 2.adjusted
        }
        
        
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        brandnameStackView.addArrangedSubviews(brandnameEN, brandnameKR)
        likeStackView.addArrangedSubviews(likeIcon, likecount)
        self.addSubviews(hatdetailImage,
                         brandnameStackView,
                         moreIcon,
                         likeStackView)
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(72.adjusted)
        }
        
        hatdetailImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        brandnameStackView.snp.makeConstraints {
            $0.top.equalTo(hatdetailImage.snp.top).offset(15.adjusted)
            $0.leading.equalTo(hatdetailImage.snp.trailing).offset(15.adjusted)
        }
        
        moreIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.adjusted)
            $0.leading.equalTo(brandnameStackView.snp.trailing).offset(5.adjusted)
        }
        
        likeStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(brandnameStackView.snp.trailing).offset(115.adjusted)
        }
    }
}
