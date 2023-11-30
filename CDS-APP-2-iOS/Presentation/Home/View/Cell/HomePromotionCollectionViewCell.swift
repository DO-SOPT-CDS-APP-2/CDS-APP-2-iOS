//
//  HomePromotionCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/27.
//

import UIKit

import SnapKit
import Then

final class HomePromotionCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var handler: (() -> (Void))?
    var isTapped: Bool = false {
        didSet {
            heartButton.isSelected = isTapped
        }
    }
    
    // MARK: - UI Components
    
    private let lineView = LineView()
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let discountLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var totalPriceStackView = UIStackView(arrangedSubviews: [discountLabel,
                                                                          priceLabel])
    private lazy var labelStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                     subTitleLabel,
                                                                     totalPriceStackView])
    private lazy var heartButton = UIButton()
    private let heartCountLabel = UILabel()
    private lazy var heartStackView = UIStackView(arrangedSubviews: [heartButton,
                                                                     heartCountLabel])
    
    // MARK: - init
    
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
        
        subTitleLabel.do {
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
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
            $0.setImage(ImageLiterals.icon.icLikeOffGrayMedium, for: .normal)
            $0.setImage(ImageLiterals.icon.icLikeOnGrayMedium, for: .selected)
            $0.addTarget(self, action: #selector(tappedHeartButton), for: .touchUpInside)
        }
        
        heartCountLabel.do {
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
            $0.textColor = .lightGray
        }
        
        totalPriceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .center
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 5.77.adjusted
            $0.alignment = .leading
        }
        
        heartStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.contentView.addSubviews(lineView,
                                     productImageView,
                                     labelStackView,
                                     heartStackView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        lineView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints {
            $0.height.width.equalTo(56.adjusted)
            $0.leading.equalToSuperview()
            $0.top.equalTo(lineView.snp.bottom).offset(10.adjusted)
        }
        
        heartButton.snp.makeConstraints {
            $0.height.width.equalTo(24.adjusted)
        }
        
        heartStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(3.46.adjusted)
            $0.centerY.equalTo(productImageView)
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(13.adjusted)
            $0.centerY.equalTo(productImageView)
        }
    }
    
    @objc
    private func tappedHeartButton() {
        handler?()
    }
    
    func configurePromotionCell(data: PromotionData) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let formattedNumber = formatter.string(from: NSNumber(value: data.price)) else { return }
        
        productImageView.kfSetImage(url: data.imageURL)
        titleLabel.text = data.brand
        subTitleLabel.text = data.name
        discountLabel.text = "\(data.discount)%"
        priceLabel.text = formattedNumber
        heartButton.isSelected = false
        heartCountLabel.text = StringLiterals.Home.thirdSection.heartCount
    }
    
    func configureAdditionCell(data: PromotionCellData) {
        productImageView.image = data.image
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
        discountLabel.text = data.percent
        priceLabel.text = data.price
        heartButton.isSelected = data.isHearted
        heartCountLabel.text = "\(data.heartCount)"
    }
}
