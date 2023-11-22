//
//  HomeTopView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/22.
//

import UIKit

import SnapKit
import Then

// MARK: - Home의 최상단 View

final class HomeTopView: UIView {
    
    // MARK: - UI Components

    private let logoImageView = UIImageView(image: ImageLiterals.img.imgLogo)
    private let searchButton = UIButton()
    private let alertButton = UIButton()
    private let cartButton = UIButton()
    private let topButtonStackView = UIStackView()

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierachy()
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions

    private func setUI() {
        self.backgroundColor = .black
        
        searchButton.do {
            $0.setImage(ImageLiterals.icon.icSearchWhite, for: .normal)
        }
        
        alertButton.do {
            $0.setImage(ImageLiterals.icon.icAlertWhite, for: .normal)
        }
        
        cartButton.do {
            $0.setImage(ImageLiterals.icon.icCartWhite, for: .normal)
        }
        
        topButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
    }
        
    private func setHierachy() {
        self.addSubviews(logoImageView,
                         topButtonStackView)
        
        topButtonStackView.addArrangedSubviews(searchButton,
                                               alertButton,
                                               cartButton)
    }
        
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(132)
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.adjusted)
            $0.leading.equalToSuperview().inset(18)
        }
        
        searchButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
        alertButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
        cartButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
        topButtonStackView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(24)
        }
    }
}

