//
//  CategoryDetailTableViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class CategoryDetailTableViewCell: UITableViewCell {
    
    private let detailCategoryList = UILabel()
    private let arrowButton = UIButton()

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
    
    private func setUI() {
        self.backgroundColor = .white
        
        detailCategoryList.do {
            $0.textColor = .black
            $0.font = .krBold(ofSize: 10.adjusted)
        }
        
        arrowButton.do {
            $0.setImage(ImageLiterals.icon.icDetailRightGray, for: .normal)
        }
    }
    
    private func setHierachy() {
        self.addSubviews(detailCategoryList, arrowButton)
    }
    
    private func setLayout() {
        detailCategoryList.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14.adjusted)
            $0.size.equalTo(20.adjusted)
        }
    }
    
    func configureCell(category: CategoryDetailList) {
        detailCategoryList.text = category.label
    }
    
}
