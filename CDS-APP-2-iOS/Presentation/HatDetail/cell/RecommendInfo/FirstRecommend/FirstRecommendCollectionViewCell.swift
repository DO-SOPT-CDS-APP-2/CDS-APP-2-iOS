//
//  FirstRecommendCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

import SnapKit
import Then

// MARK: - 1번째 추천 CollectionView - Recommend

final class FirstRecommendCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private let recommendDummy = RecommendItem.recommendDummy()
    
    private let firstCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 153, height: 330)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    private let recommendLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
        setDelegate()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - set UI
    
    private func setUI() {

        firstCollecitonView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        
        recommendLabel.do {
            $0.text = "타입서비스의 이 상품은 어때요?"
            $0.font = .krBold(ofSize: 18.adjusted)
        }
        let brandString = NSMutableAttributedString(string: recommendLabel.text ?? "")
        brandString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 5))
        brandString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 5, length: brandString.length - 5))
        recommendLabel.attributedText = brandString
    }
    
    // MARK: - set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(recommendLabel,
                                firstCollecitonView)
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        recommendLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        firstCollecitonView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(recommendLabel.snp.leading)
            $0.height.equalTo(253.adjusted)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }

    }
    
    // MARK: - set Delegate
    
    private func setDelegate() {
        self.firstCollecitonView.delegate = self
        self.firstCollecitonView.dataSource = self
    }
    
    
    // MARK: - set CollectionView
    
    private func setupCollectionView() {
        firstCollecitonView.register(FirstDetailCollectionViewCell.self,
                                     forCellWithReuseIdentifier: FirstDetailCollectionViewCell.className)
    }
}

extension FirstRecommendCollectionViewCell: UICollectionViewDelegate {}
extension FirstRecommendCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FirstDetailCollectionViewCell.className,
                                                            for: indexPath) as? FirstDetailCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(item: recommendDummy[indexPath.row])
        return item
    }
}
