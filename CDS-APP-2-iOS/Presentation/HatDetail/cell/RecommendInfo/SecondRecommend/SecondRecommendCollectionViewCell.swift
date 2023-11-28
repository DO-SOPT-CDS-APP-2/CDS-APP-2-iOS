//
//  SecondRecommendCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

import SnapKit
import Then

class SecondRecommendCollectionViewCell: UICollectionViewCell {

    private let eventDummy = EventItem.eventDummy()
    
    // 2번째 추천 CollectionView - Event
    private let secondCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 217, height: UIScreen.main.bounds.height/2)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 8.adjusted
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    private let eventLabel = UILabel()
    
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
    
    // MARK: - Set UI
    
    private func setUI() {
        secondCollecitonView.showsHorizontalScrollIndicator = false
        
        eventLabel.do {
            $0.text = "관련 이벤트"
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
        }
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(eventLabel, secondCollecitonView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        eventLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        secondCollecitonView.snp.makeConstraints {
            $0.top.equalTo(eventLabel.snp.bottom).offset(20.adjusted)
            $0.leading.equalTo(eventLabel.snp.leading)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(201.adjusted)
        }
    }
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.secondCollecitonView.delegate = self
        self.secondCollecitonView.dataSource = self
    }
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        secondCollecitonView.register(SecondDetailCollectionViewCell.self, forCellWithReuseIdentifier: SecondDetailCollectionViewCell.className)
    }
}

extension SecondRecommendCollectionViewCell: UICollectionViewDelegate {}
extension SecondRecommendCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: SecondDetailCollectionViewCell.className,
                                                                    for: indexPath) as? SecondDetailCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(item: eventDummy[indexPath.row])
        return item
    }
}
