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
            $0.showsVerticalScrollIndicator = false
        }
        
        categoryDetailTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.isUserInteractionEnabled = true
            $0.showsVerticalScrollIndicator = false
        }
        
    }
    
    private func setHierachy() {
        self.addSubviews(categoryTableView,
                         categoryDetailTableView)
    }
}
