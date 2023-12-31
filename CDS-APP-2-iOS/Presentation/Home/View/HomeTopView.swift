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
    private let chipViews: [ChipView] = [ChipView(text: StringLiterals.Home.chip.woman,
                                                  chipStyle: .backgroundIsBlack),
                                         ChipView(text: StringLiterals.Home.chip.man,
                                                  chipStyle: .backgroundIsBlack),
                                         ChipView(text: StringLiterals.Home.chip.life,
                                                  chipStyle: .backgroundIsBlack),
                                         ChipView(text: StringLiterals.Home.chip.best,
                                                  chipStyle: .backgroundIsBlack),
                                         ChipView(text: StringLiterals.Home.chip.recommand,
                                                  chipStyle: .backgroundIsBlack) ]
    private let chipStackView = UIStackView()

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
            $0.spacing = 15.adjusted
        }
        
        chipStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8.adjusted
        }
        
        // 맨 처음 ChipView만 label font가 다르기 때문에, 첫번째 요소만 가져와 폰트 변경해주는 코드 작성
        if let firstSubview = chipStackView.arrangedSubviews.first as? ChipView {
            firstSubview.tagLabel.font = .krSemiBold(ofSize: 12.adjusted)
            firstSubview.tagLabel.textColor = .white
            firstSubview.layer.borderColor = UIColor.white.cgColor
        }
    }
        
    private func setHierachy() {
        self.addSubviews(logoImageView,
                         topButtonStackView, chipStackView)
        
        topButtonStackView.addArrangedSubviews(searchButton,
                                               alertButton,
                                               cartButton)
        
        chipViews.forEach {
            chipStackView.addArrangedSubview($0)
        }
    }

    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(132.adjusted)
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.adjusted)
            $0.leading.equalToSuperview().inset(18.adjusted)
        }
        
        searchButton.snp.makeConstraints {
            $0.height.width.equalTo(24.adjusted)
        }
        
        alertButton.snp.makeConstraints {
            $0.height.width.equalTo(24.adjusted)
        }
        
        cartButton.snp.makeConstraints {
            $0.height.width.equalTo(24.adjusted)
        }
        
        topButtonStackView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(17.adjusted)
            $0.height.equalTo(24.adjusted)
        }
        
        chipStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(15.adjusted)
            $0.leading.equalToSuperview().inset(18.adjusted)
            $0.height.equalTo(30.adjusted)
        }
    }
}
