//
//  HomeSeeAllReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class HomeSeeAllReusableView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let seeAllLabel = UILabel()

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setUI() {
        self.do {
            $0.setRoundBorder(borderColor: .border,
                              borderWidth: 0.96.adjusted,
                              cornerRadius: 0)
            $0.backgroundColor = .white
        }
        
        seeAllLabel.do {
            $0.font = .krMedium(ofSize: 12)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.text = StringLiterals.Home.fourthSection.footer
        }
    }
        
    private func setHierachy() {
        self.addSubview(seeAllLabel)
    }
    
    private func setLayout() {
        seeAllLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
