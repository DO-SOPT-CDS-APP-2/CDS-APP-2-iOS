//
//  HomeView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/24.
//

import UIKit

import SnapKit
import Then

// MARK: - Home의 최상단 View

final class HomeView: UIView {
    
    // MARK: - UI Components
    
    private let homeTopView = HomeTopView()

    // MARK: - Life Cycle
    
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
    
    // MARK: - Functions

    private func setUI() {
        
    }
        
    private func setHierachy() {
        self.addSubviews(homeTopView)
    }
        
    private func setLayout() {
        homeTopView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
