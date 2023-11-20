//
//  CategoryDetailTableViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

protocol HatButtonAction: AnyObject {
    func hatButtonClicked()
}

final class CategoryDetailTableViewCell: UITableViewCell {
    
    private let detailCategoryList = UILabel()
    private let arrowButton = UIButton()
    private let transparentButton = UIButton()
    
    weak var cellDelegate: HatButtonAction?

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
            $0.font = .krSemiBold(ofSize: 12.adjusted)
        }
        
        arrowButton.do {
            $0.setImage(ImageLiterals.icon.icDetailRightGray, for: .normal)
        }
        
        transparentButton.do {
            $0.backgroundColor = .clear
        }
    }
    
    private func setHierachy() {
        contentView.addSubviews(detailCategoryList,
                                arrowButton,
                                transparentButton)
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
        
        transparentButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(category: CategoryDetailList, index: Int) {
        detailCategoryList.text = category.label
        // 영어일 때로 추후 변경
        if index == 1 || index == 2 || index == 3 || index == 17 {
            detailCategoryList.font = .enDisplayBold(ofSize: 10.adjusted)
        } else {
            detailCategoryList.font = .krSemiBold(ofSize: 12.adjusted)
        }
        
        // "모자" Cell이 클릭되었을 경우에만 push
        if index == 5 {
            transparentButton.addTarget(self, action: #selector(hatButtonClicked), for: .touchUpInside)
        }
    }
    
    @objc
    private func hatButtonClicked() {
        cellDelegate?.hatButtonClicked()
    }
    
}
