//
//  HomeTitleReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class HomeTitleReusableView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()

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
        titleLabel.do {
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
            $0.textAlignment = .left
        }
    }
        
    private func setHierachy() {
        self.addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    }
    
    func configureHeader(data: String) {
        titleLabel.text = data
    }
}
