//
//  HomeProductCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class HomeProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var handler: (() -> (Void))?
    var isTapped: Bool = false {
        didSet {
            heartButton.isSelected = isTapped
        }
    }
    
    // MARK: - UI Components
    
    private let productImageView = UIImageView()
    private var titleLabel = UILabel()
    private let discountLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var totalPriceStackView = UIStackView(arrangedSubviews: [discountLabel,
                                                                          priceLabel])
    private lazy var labelStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                     totalPriceStackView])
    private lazy var heartButton = UIButton()
    
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
        titleLabel.do {
            $0.font = .krBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        discountLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.textColor = .point
        }
        
        priceLabel.do {
            $0.font = .enDisplayBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        heartButton.do {
            $0.setImage(ImageLiterals.icon.icLikeOffGrayBig, for: .normal)
            $0.setImage(ImageLiterals.icon.icLikeOnGrayBig, for: .selected)
            $0.addTarget(self, action: #selector(tappedHeartButton), for: .touchUpInside)
        }
        
        totalPriceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6.adjusted
            $0.alignment = .center
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 3.85.adjusted
            $0.alignment = .leading
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(productImageView,
                         labelStackView,
                         heartButton)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.height.width.equalTo(166.adjusted)
            $0.leading.top.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(productImageView)
        }
        
        heartButton.snp.makeConstraints {
            $0.height.width.equalTo(24.adjusted)
            $0.top.equalTo(productImageView.snp.bottom).offset(4.adjusted)
            $0.trailing.equalTo(productImageView)
        }
    }
    
    @objc
    private func tappedHeartButton() {
        handler?()
    }
    
    func configureCell(data: ProductCellData) {
        productImageView.image = data.image
        titleLabel.text = data.title
        discountLabel.text = data.percent
        priceLabel.text = data.price
        heartButton.isSelected = data.isHearted
    }
}

