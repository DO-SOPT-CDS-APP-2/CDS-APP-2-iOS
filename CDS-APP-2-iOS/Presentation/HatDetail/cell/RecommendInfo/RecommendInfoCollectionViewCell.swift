//
//  RecommendInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

// MARK: - 추천 Section main Cell

class RecommendInfoCollectionViewCell: UICollectionViewCell {

    private let detailCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 350)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 8.adjusted
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()

    private let thickdivideView = UIView()
    
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

        detailCollecitonView.do {
            $0.backgroundColor = .white
            $0.isScrollEnabled = false
        }
        
        thickdivideView.do {
            $0.backgroundColor = .background
        }
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubviews(detailCollecitonView, thickdivideView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        detailCollecitonView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        thickdivideView.snp.makeConstraints {
            $0.top.equalTo(detailCollecitonView.snp.bottom).inset(70.adjusted)
            $0.height.equalTo(8)
            $0.width.equalTo(contentView.snp.width)

        }
    }
    
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
    }
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        detailCollecitonView.register(FirstRecommendCollectionViewCell.self, forCellWithReuseIdentifier: FirstRecommendCollectionViewCell.className)
        detailCollecitonView.register(SecondRecommendCollectionViewCell.self, forCellWithReuseIdentifier: SecondRecommendCollectionViewCell.className)
    }
}


extension RecommendInfoCollectionViewCell: UICollectionViewDelegate {}
extension RecommendInfoCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 1
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: FirstRecommendCollectionViewCell.className, for: indexPath) as! FirstRecommendCollectionViewCell

            return item
        } else {
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: SecondRecommendCollectionViewCell.className,
                                                                for: indexPath) as? SecondRecommendCollectionViewCell else {return UICollectionViewCell()}

            return item
        }

    }
    

}

extension RecommendInfoCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 350.adjusted)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 270.adjusted)
        default:
            return CGSize(width: 0.0, height: 0.0)
        }
    }
}
