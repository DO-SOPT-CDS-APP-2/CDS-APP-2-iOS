//
//  RecommendInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/20.
//

import UIKit

import SnapKit
import Then

class RecommendInfoCollectionViewCell: UICollectionViewCell {

    private let detailCollecitonView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 8.adjusted
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()

    
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
        detailCollecitonView.backgroundColor = .white
        detailCollecitonView.isScrollEnabled = false
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(detailCollecitonView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        detailCollecitonView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
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

//extension RecommendInfoCollectionViewCell: UICollectionViewFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.section {
//        case 0:
//            return CGSize(width: collectionView.bounds.width, height: 300.adjusted)
//        case 1:
//            return CGSize(width: collectionView.bounds.width, height: 250.adjusted)
//        default:
//            return CGSize(width: 0.0, height: 0.0)
//        }
//    }
//}
