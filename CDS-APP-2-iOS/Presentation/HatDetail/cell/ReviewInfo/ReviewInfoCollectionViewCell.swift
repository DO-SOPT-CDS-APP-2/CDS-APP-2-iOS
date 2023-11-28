//
//  ReviewInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

class ReviewInfoCollectionViewCell: UICollectionViewCell {
    
    private let GPALabel = UILabel()
    private let sizeLabel = UILabel()
    private let colorLabel = UILabel()
    private let qualityLabel = UILabel()
    
    private let scoreLabel = UILabel()
    
    private let reviewStackView = UIStackView()
    private let starStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        GPALabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.GPA
            $0.textColor = .black
        }
        
        sizeLabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.size
            $0.textColor = .lightGray
        }
        
        colorLabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.color
            $0.textColor = .lightGray
        }
        
        qualityLabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.quality
            $0.textColor = .lightGray
        }
        
        scoreLabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.score
            $0.font = .enDisplayBold(ofSize: 14)
        }
        let scoreString = NSMutableAttributedString(string: scoreLabel.text ?? "")
        scoreString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 3))
        scoreString.addAttribute(.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 3, length: scoreString.length - 3))
        scoreLabel.attributedText = scoreString
        
        
        
        [GPALabel, sizeLabel, colorLabel, qualityLabel].forEach {
            $0.font = .krBold(ofSize: 14.adjusted)
            $0.textAlignment = .center
        }
        
        reviewStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 15
        }
        
        starStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        (1...5).forEach { i in
            let starImageView = UIImageView()
            starImageView.image = ImageLiterals.icon.icStarRed
            starStackView.addArrangedSubview(starImageView)
        }
        
        
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        reviewStackView.addArrangedSubviews(GPALabel, sizeLabel, colorLabel, qualityLabel)
        contentView.addSubviews(reviewStackView, starStackView, scoreLabel)
    }
    
    
    
    // MARK: - Set Layout
    
    private func setLayout() {
        reviewStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        starStackView.snp.makeConstraints {
            $0.top.equalTo(reviewStackView.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(2.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
