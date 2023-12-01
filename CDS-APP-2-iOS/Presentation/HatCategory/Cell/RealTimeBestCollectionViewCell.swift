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

        brandName.do {
            $0.font = UIFont.krSemiBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
        
        salePercent.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .point
        }
        
        itemPrice.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.contentView.addSubviews(realtimeBestImageView,
                         brandName,
                         salePercent,
                         itemPrice)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        realtimeBestImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.size.equalTo(115.adjusted)
        }
        brandName.snp.makeConstraints {
            $0.top.equalTo(realtimeBestImageView.snp.bottom).offset(10.adjusted)
            $0.leading.equalToSuperview()
        }
        salePercent.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(3.adjusted)
            $0.leading.equalToSuperview()
        }
        itemPrice.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(3.adjusted)
            $0.leading.equalTo(salePercent.snp.trailing).offset(4.adjusted)
        }
    }
    
    //MARK: - Methods
    
    func bindData(item: RealtimeBestItem) {
        realtimeBestImageView.image = item.image
        brandName.text = item.brandName
        if let percent = item.salePercent {
            salePercent.text = percent
        } else {
            salePercent.text = nil
            itemPrice.snp.makeConstraints {
                $0.leading.equalToSuperview()
            }
            
            self.layoutIfNeeded()
        }
        itemPrice.text = item.itemPrice
    }
}
