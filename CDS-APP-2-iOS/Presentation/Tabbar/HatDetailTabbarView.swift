//
//  HatDetailTabbarView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 12/7/23.
//

import UIKit

import SnapKit
import Then

final class HatDetailTabbarView: UIView {
    
    //MARK: - set Properties
    
    private let heartImageView = UIImageView()
    private let shareImageView = UIImageView()
    private let presentLabel = UILabel()
    private let buyLabel = UILabel()
    private let borderLine = UIView()
    
    //MARK: - Life Cycle
    
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
    
    //MARK: - set UI
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .black
        }
        
        heartImageView.do {
            $0.image = ImageLiterals.icon.icLikeOffWhiteMedium
        }
        
        shareImageView.do {
            $0.image = ImageLiterals.icon.icShare
        }
        
        presentLabel.do {
            $0.text = "선물하기"
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .white
        }
        
        buyLabel.do {
            $0.text = "구매하기"
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .point
        }
        
        borderLine.do {
            $0.backgroundColor = .border
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(heartImageView,
                         shareImageView,
                         presentLabel,
                         buyLabel,
                         borderLine)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        heartImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21.adjusted)
            $0.leading.equalToSuperview().inset(22.adjusted)
        }
        
        shareImageView.snp.makeConstraints {
            $0.top.equalTo(heartImageView.snp.top)
            $0.leading.equalTo(heartImageView.snp.trailing).offset(22.adjusted)
        }
        
        presentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23.adjusted)
            $0.leading.equalTo(shareImageView.snp.trailing).offset(77.adjusted)
        }
        
        borderLine.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.adjusted)
            $0.leading.equalTo(presentLabel.snp.trailing).offset(21.adjusted)
            $0.height.equalTo(17.adjusted)
            $0.width.equalTo(1.adjusted)
        }
        
        buyLabel.snp.makeConstraints {
            $0.top.equalTo(presentLabel.snp.top)
            $0.leading.equalTo(borderLine.snp.trailing).offset(21.adjusted)
        }
    }
    
}
