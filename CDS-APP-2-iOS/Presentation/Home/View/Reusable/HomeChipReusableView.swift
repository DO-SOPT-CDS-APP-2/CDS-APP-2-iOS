//
//  HomeChipReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/29.
//

import UIKit

import SnapKit
import Then

final class HomeChipReusableView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let chipViews: [ChipView] = [ChipView(text: StringLiterals.Home.chip.hat,
                                                  chipStyle: .backgroundIsWhite),
                                         ChipView(text: StringLiterals.Home.chip.jewelry,
                                                  chipStyle: .backgroundIsWhite),
                                         ChipView(text: StringLiterals.Home.chip.watch,
                                                  chipStyle: .backgroundIsWhite),
                                         ChipView(text: StringLiterals.Home.chip.eye,
                                                  chipStyle: .backgroundIsWhite),
                                         ChipView(text: StringLiterals.Home.chip.fashion,
                                                  chipStyle: .backgroundIsWhite) ]
    private let chipStackView = UIStackView()

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setHierachy()
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setUI() {
        titleLabel.do {
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
            $0.textAlignment = .left
            $0.text = StringLiterals.Home.sixthSection.header
        }
        
        chipStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3.adjusted
        }
        
        if let firstSubview = chipStackView.arrangedSubviews.first as? ChipView {
            firstSubview.tagLabel.font = .krSemiBold(ofSize: 12.adjusted)
            firstSubview.tagLabel.textColor = .white
            firstSubview.layer.borderColor = UIColor.black.cgColor
            firstSubview.backgroundColor = .black
        }
    }
        
    private func setHierachy() {
        self.addSubviews(titleLabel,
                         chipStackView)
        
        chipViews.forEach {
            chipStackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(chipStackView.snp.top).offset(-15.adjusted)
        }
        
        chipStackView.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
        }
    }
}
