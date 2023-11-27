//
//  RealTimeBestCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

final class RealTimeBestCollectionViewCell: UICollectionViewCell {
    
    //MARK: - set Properties
    
    var realtimeBestImageView = UIImageView()
    private let rankingBackgroundView = UIView()
    var rankingNumber = UILabel()
    
    var brandName = UILabel()
    var salePercent = UILabel()
    var itemPrice = UILabel()
    
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
    
    // MARK: - Set UI
    
    private func setUI() {
        
        realtimeBestImageView.do {
            $0.contentMode = .scaleAspectFill
        }
        
        rankingBackgroundView.do {
            $0.backgroundColor = .black
            $0.frame = CGRect(x: 0, y: 0, width: 24.adjusted, height: 24.adjusted)
        }
        
        rankingNumber.do {
            $0.font = UIFont.enDisplayMedium(ofSize: 11.adjusted)
            $0.textColor = .white
        }
        
        brandName.do {
            $0.font = UIFont.krSemiBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
        
        salePercent.do {
            $0.font = UIFont.krBold(ofSize: 12.adjusted)
            $0.textColor = .point
        }
        
        itemPrice.do {
            $0.font = UIFont.krBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
        
        
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(realtimeBestImageView,
                         brandName,
                         salePercent,
                         itemPrice)
        
        realtimeBestImageView.addSubviews(rankingBackgroundView,
                                          rankingNumber)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        realtimeBestImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.size.equalTo(115.adjusted)
        }
        brandName.snp.makeConstraints {
            $0.top.equalTo(realtimeBestImageView.snp.bottom).inset(10.adjusted)
            $0.leading.equalToSuperview()
        }
        salePercent.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).inset(3.adjusted)
            $0.leading.equalToSuperview()
        }
        itemPrice.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).inset(3.adjusted)
            $0.leading.equalTo(salePercent.snp.trailing).inset(4.adjusted)
        }
    }
    
    //MARK: - Methods
    
}
