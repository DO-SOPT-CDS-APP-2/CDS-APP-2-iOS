//
//  ReviewInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

class ReviewInfoCollectionViewCell: UICollectionViewCell {
    
    private let reviewPhotoDummy = ReviewPhotoItem.reviewPhotoDummy()
    
    private let reviewCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 110.adjusted, height: 110.adjusted)

        flowLayout.minimumInteritemSpacing = 3
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    private let GPALabel = UILabel()
    private let sizeLabel = UILabel()
    private let colorLabel = UILabel()
    private let qualityLabel = UILabel()
    private let scoreLabel = UILabel()
    private let reviewStackView = UIStackView()
    private let starStackView = UIStackView()
    private let reviewTitleLabel = UILabel()
    
    private let moreReviewButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
        setDelegate()
        setupCollectionView()
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
            $0.font = .enDisplayBold(ofSize: 14.adjusted)
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
        
        reviewTitleLabel.do {
            $0.text = StringLiterals.HatDetail.ReviewInfo.reviewCount
            $0.font = .krBold(ofSize: 18.adjusted)
        }
        
        moreReviewButton.do {
            $0.setTitle(StringLiterals.HatDetail.ReviewInfo.moreReview, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .krMedium(ofSize: 14.adjusted)
            $0.layer.borderColor = UIColor.border.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 2
            $0.contentHorizontalAlignment = .left
        }
        
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        reviewStackView.addArrangedSubviews(GPALabel, sizeLabel, colorLabel, qualityLabel)
        contentView.addSubviews(reviewStackView, starStackView, scoreLabel, reviewTitleLabel, reviewCollectionView, moreReviewButton)
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
        
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(scoreLabel.snp.bottom).offset(30.adjusted)
            $0.leading.equalTo(reviewStackView)
        }
        
        reviewCollectionView.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(15.adjusted)
            $0.leading.equalTo(reviewStackView)
            $0.height.equalTo(223.adjusted)
            $0.width.equalTo(336.adjusted)
        }
        
        moreReviewButton.snp.makeConstraints {
            $0.top.equalTo(reviewCollectionView.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(336.adjusted)
            $0.height.equalTo(48.adjusted)
        }
    }
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.reviewCollectionView.delegate = self
        self.reviewCollectionView.dataSource = self
    }
    
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        reviewCollectionView.register(ReviewPhotoCollectionViewCell.self, forCellWithReuseIdentifier: ReviewPhotoCollectionViewCell.className)
    }
}

extension ReviewInfoCollectionViewCell: UICollectionViewDelegate {}
extension ReviewInfoCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewPhotoCollectionViewCell.className,
                                                            for: indexPath) as? ReviewPhotoCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(item: reviewPhotoDummy[indexPath.row])
        return item
    }

}
