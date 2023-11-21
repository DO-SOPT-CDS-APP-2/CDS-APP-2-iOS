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
    
    let categoryTableView = UITableView(frame: .zero, style: .grouped)
    let categoryDetailTableView = UITableView(frame: .zero, style: .grouped)
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))

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
        
        divisionLine.do {
            $0.layer.addBorder([.top], color: .border, width: 0.96)
        }
        
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
        self.addSubviews(divisionLine,
                         categoryTableView,
                         categoryDetailTableView)
    }
    
    private func setLayout() {
        divisionLine.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
