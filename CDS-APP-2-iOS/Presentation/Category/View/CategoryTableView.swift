//
//  CategoryTableView.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

// MARK: - List TableView, Detail List TableView

final class CategoryTableView: UIView {
    
    // MARK: - Properties

    let categoryTableView = UITableView(frame: .zero, style: .grouped)
    let categoryDetailTableView = UITableView(frame: .zero, style: .grouped)
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))

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
    
    // MARK: - Set UI

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
            $0.rowHeight = 56.adjusted
            $0.contentInset = UIEdgeInsets(top: -15, left: 0, bottom: -15, right: 0)
        }
        
        categoryDetailTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.isUserInteractionEnabled = true
            $0.showsVerticalScrollIndicator = false
            $0.rowHeight = 46.adjusted
            $0.sectionHeaderHeight = 178.adjusted
        }
        
    }
    
    // MARK: - Set Hierachy

    private func setHierachy() {
        self.addSubviews(divisionLine,
                         categoryTableView,
                         categoryDetailTableView)
    }
    
    // MARK: - Set Layout

    private func setLayout() {
        divisionLine.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
