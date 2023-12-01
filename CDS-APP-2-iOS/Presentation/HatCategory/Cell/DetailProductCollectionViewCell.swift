//
//  DetailProductCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/29/23.
//

import UIKit

final class DetailProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - set Properties
    
    private let productImageView = UIImageView()
    private let hearticonImageView = UIImageView()
    private let starIconImageView = UIImageView()
    
    private let brandName = UILabel()
    private let productName = UILabel()
    private let salePercent = UILabel()
    private let productPrice = UILabel()
    
    private let freeDelivery = FreeDelieveryChipView()
    private let heartNumber = UILabel()
    private let starRate = UILabel()
    private let starNumber = UILabel()
    private var productID: Int = Int()
    private lazy var likedButton = UIButton()
    
    var handler: (() -> (Void))?
    var isTapped: Bool = false {
        didSet {
            likedButton.isSelected = isTapped
        }
    }
    
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
        brandName.do {
            $0.font = UIFont.krBold(ofSize: 10.adjusted)
            $0.textColor = .black
        }
        
        productName.do {
            $0.font = UIFont.enDisplayMedium(ofSize: 10.adjusted)
            $0.lineBreakMode = .byWordWrapping
            $0.numberOfLines = 2
        }
        
        salePercent.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .point
        }
        
        productPrice.do {
            $0.font = UIFont.enDisplayBold(ofSize: 12.adjusted)
            $0.textColor = .black
        }
        
        hearticonImageView.do {
            $0.image = ImageLiterals.icon.icHeart
        }
        
        heartNumber.do {
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
            $0.textColor = .mediumGray
        }
        
        starIconImageView.do {
            $0.image = ImageLiterals.icon.icStarGray
        }
        
        starRate.do {
            $0.text = "5.0"
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
            $0.textColor = .mediumGray
        }
        
        starNumber.do {
            $0.font = .enDisplayMedium(ofSize: 8.adjusted)
            $0.textColor = .mediumGray
        }
        
        likedButton.do {
            $0.setImage(ImageLiterals.icon.icLikeOffBlackMedium, for: .normal)
            $0.setImage(ImageLiterals.icon.icLikeOnBlackMedium, for: .selected)
            $0.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.contentView.addSubviews(productImageView,
                                     brandName,
                                     productName,
                                     salePercent,
                                     productPrice)
        self.contentView.addSubviews(freeDelivery,
                                     hearticonImageView,
                                     heartNumber,
                                     starIconImageView,
                                     starRate,
                                     starNumber,
                                     likedButton)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.size.equalTo(187.adjusted)
        }
        
        brandName.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
        }
        
        productName.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(10.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.width.equalTo(165.adjusted)
        }
        
        salePercent.snp.makeConstraints {
            $0.top.equalTo(productName.snp.bottom).offset(9.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
        }
        
        productPrice.snp.makeConstraints {
            $0.top.equalTo(productName.snp.bottom).offset(9.adjusted)
            $0.leading.equalTo(salePercent.snp.trailing).offset(4.adjusted)
        }
        
        freeDelivery.snp.makeConstraints {
            $0.top.equalTo(productPrice.snp.bottom).offset(7.adjusted)
            $0.leading.equalToSuperview().offset(12.adjusted)
            $0.width.equalTo(43.adjusted)
            $0.height.equalTo(18.adjusted)
        }
        
        hearticonImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(11.adjusted)
        }
        
        heartNumber.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(hearticonImageView.snp.trailing).offset(3.adjusted)
        }
        
        starIconImageView.snp.makeConstraints {
            $0.top.equalTo(hearticonImageView.snp.top)
            $0.leading.equalTo(heartNumber.snp.trailing).offset(8.adjusted)
        }
        
        starRate.snp.makeConstraints {
            $0.top.equalTo(heartNumber.snp.top)
            $0.leading.equalTo(starIconImageView.snp.trailing).offset(3.adjusted)
        }
        
        starNumber.snp.makeConstraints {
            $0.top.equalTo(starRate.snp.top)
            $0.leading.equalTo(starRate.snp.trailing).offset(4.adjusted)
        }
        
        likedButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(13.adjusted)
            $0.trailing.equalToSuperview().inset(11.adjusted)
        }
    }
    
    //MARK: - Methods
    
    func bindData(data: HatCategoryDTO) {
        productID = data.productId
        productImageView.kfSetImage(url: data.imageUrl)
        brandName.text = data.brand
        productName.text = data.name
        if data.discount == 0 {
            salePercent.text = nil
            productPrice.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(12.adjusted)
            }
        } else {
            salePercent.text = "\(data.discount)%"
        }
        
        self.layoutIfNeeded()
        
        // 가격에 세자리마다 콤마 찍어주기
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = numberFormatter.string(for: data.price)
        productPrice.text = price
    }
    
    func bindHeartandStarNumber(data: DetailProductHeartandStar) {
        heartNumber.text = data.heart
        starNumber.text = data.star
    }
    
    @objc
    func likeTapped() {
        handler?()
    }
}
