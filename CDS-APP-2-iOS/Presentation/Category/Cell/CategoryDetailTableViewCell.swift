//
//  CategoryDetailTableViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

// MARK: - Protocol

protocol HatButtonAction: AnyObject {
    func hatButtonClicked()
}

// MARK: - CategoryDetailTableViewCell

final class CategoryDetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let detailCategoryList = UILabel()
    private let arrowButton = UIButton()
    private let transparentButton = UIButton()
    
    weak var cellDelegate: HatButtonAction? // 위에서 선언한 프로토콜을 저장 프로퍼티의 타입으로 채택

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
    
    // MARK: - Set Hierachy

    private func setHierachy() {
        contentView.addSubviews(detailCategoryList,
                                arrowButton,
                                transparentButton)
    }
    
    // MARK: - Set Layout
    
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
    
    // MARK: - Configure Cell (CategoryDetailTableView의 각 Cell 설정)
    
    func configureCell(category: CategoryDetailList, index: Int) {
        detailCategoryList.text = category.label
        
        // "모자" Cell이 클릭되었을 경우에만 push
        if index == 5 {
            transparentButton.addTarget(self, action: #selector(hatButtonClicked), for: .touchUpInside)
        }
        
        // 영어와 한글에 각각 다른 font 적용
        for string in category.label.unicodeScalars {
            // ASCII 범위 (영어)
            if string.value >= 65 && string.value <= 122 {
                detailCategoryList.font = .enDisplayBold(ofSize: 10.adjusted)
            }
            // ASCII 범위 (한글)
            if string.value >= 44032 && string.value <= 55215 {
                detailCategoryList.font = .krSemiBold(ofSize: 12.adjusted)
            }
        }
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func hatButtonClicked() {
        cellDelegate?.hatButtonClicked()
    }
}
