//
//  CategoryTableViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

// MARK: - CategoryTableViewCell

final class CategoryTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    private let categoryList = UILabel()
        
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUI()
        setHierachy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set UI

    private func setUI() {
        categoryList.do {
            $0.textColor = .black
            $0.font = .krRegular(ofSize: 14.adjusted)
        }
        
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(categoryList)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        categoryList.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21.adjusted)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Configure Cell (CategoryTableView의 각 Cell 설정)
    
    func configureCell(category: CategoryList, index: Int) {
        categoryList.text = category.label
        if index == 3 {
            self.backgroundColor = .white
            categoryList.font = .krBold(ofSize: 14.adjusted)
        } else {
            self.backgroundColor = .background
        }
    }

}
