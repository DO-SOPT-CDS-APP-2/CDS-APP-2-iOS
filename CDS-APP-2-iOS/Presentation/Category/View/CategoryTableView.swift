//
//  CategoryTableView.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class CategoryTableView: UIView {
    
    let categoryTableView = UITableView()
    let categoryDetailTableView = UITableView()
    
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
        
        categoryTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .background
            $0.isUserInteractionEnabled = true
        }
        
        categoryDetailTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.isUserInteractionEnabled = true
        }
        
    }
    
    private func setHierachy() {
        self.addSubviews(categoryTableView,
                         categoryDetailTableView)
    }
    
    private func setLayout() {
        categoryTableView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(114.adjusted)
            $0.height.equalTo(780.adjusted)
        }
        
        categoryDetailTableView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalTo(261.adjusted)
            $0.height.equalTo(780.adjusted)
        }
    }
}
