//
//  CategoryView.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class CategoryView: UIView {
    
    private let searchBar = UISearchBar()
    private let searchButton = UIButton()
    private let alarmButton = UIButton()
    private let cartButton = UIButton()
    lazy var horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()

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
        
        searchBar.do {
            // container border 제거
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white.cgColor
            
            // corner 자연스럽게
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 25.adjusted
            
            $0.searchTextField.layer.masksToBounds = true
            $0.searchTextField.layer.cornerRadius = 20.adjusted
            $0.searchTextField.backgroundColor = .background
            
            // place holder 설정
            let attributedString = NSMutableAttributedString(string: StringLiterals.category.header.searchBarPlaceHolder, attributes: [
                NSAttributedString.Key.font: UIFont.krMedium(ofSize: 12.adjusted) as Any,
                NSAttributedString.Key.foregroundColor: UIColor.mediumGray as Any
               ])
            $0.searchTextField.attributedPlaceholder = attributedString
            $0.searchTextField.leftViewMode = .never
            $0.searchTextField.leftView = nil
        }
        
        searchButton.do {
            $0.setImage(ImageLiterals.icon.icSearchBlack, for: .normal)
        }
        
        alarmButton.do {
            $0.setImage(ImageLiterals.icon.icAlertBlack, for: .normal)
        }
        
        cartButton.do {
            $0.setImage(ImageLiterals.icon.icCartBlack, for: .normal)
        }
        
        horizontalCollectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: 52.adjusted, height: 78.adjusted)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            $0.minimumLineSpacing = 14
            $0.minimumInteritemSpacing = 0
            $0.scrollDirection = .horizontal
            $0.estimatedItemSize = .zero
        }
    }
    
    private func setHierachy() {
        self.addSubviews(searchBar,
                         searchButton,
                         alarmButton,
                         cartButton,
                         horizontalCollectionView)
    }
    
    private func setLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.height.equalTo(30.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.trailing.equalToSuperview().inset(93.adjusted)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.trailing.equalTo(searchBar.snp.trailing).offset(-15.adjusted)
            $0.size.equalTo(24.adjusted)
        }
        
        alarmButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.leading.equalTo(searchBar.snp.trailing).offset(5.adjusted)
            $0.size.equalTo(24.adjusted)
        }
        
        cartButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.leading.equalTo(alarmButton.snp.trailing).offset(15.adjusted)
            $0.size.equalTo(24.adjusted)
        }
        
        horizontalCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(110.adjusted)
        }
    }
    
}
