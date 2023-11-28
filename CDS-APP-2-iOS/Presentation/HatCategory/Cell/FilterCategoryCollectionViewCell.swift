//
//  FilterCategoryCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/28/23.
//

import UIKit

final class FilterCategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - set Properties
    
    private let label = UILabel()
    private let downDetailImageView = UIImageView()

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set UI
    
    private func setUI() {
        self.do {
            $0.layer.borderColor = UIColor.border.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 18.adjusted
        }
        
        label.do {
            $0.font = UIFont.krSemiBold(ofSize: 12.adjusted)
            $0.textColor = .darkGray
        }
        
        downDetailImageView.do {
            $0.image = ImageLiterals.icon.icDetailDownGraySmall
            $0.contentMode = .scaleAspectFit
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(label, downDetailImageView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9.adjusted)
            $0.leading.equalToSuperview().inset(14.adjusted)
        }
        
        downDetailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9.adjusted)
            $0.bottom.equalToSuperview().inset(8.adjusted)
            $0.leading.equalTo(label.snp.trailing).offset(5.adjusted)
            $0.trailing.equalToSuperview().inset(12.adjusted)
        }
    }
    
    //MARK: - Methods
    
    func bindData(filterCategory: String) {
        label.text = filterCategory
    }
}
