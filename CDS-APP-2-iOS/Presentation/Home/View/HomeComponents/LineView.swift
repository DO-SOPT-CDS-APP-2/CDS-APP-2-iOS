//
//  LineView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

import SnapKit
import Then

// MARK: - Home의 최상단 View

final class LineView: UIView {

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setUI() {
        self.backgroundColor = .background
    }
        
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(0.96.adjusted)
        }
    }
}

