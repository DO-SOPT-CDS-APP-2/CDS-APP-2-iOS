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
        flowLayout.itemSize = CGSize(width: 100, height: UIScreen.main.bounds.height/2)
        flowLayout.scrollDirection = .horizontal
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
        detailCollecitonView.backgroundColor = .clear
    }
    
    
    // MARK: - Set Layout
    
    private func setLayout() {
        detailCollecitonView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(253)
        }
    }
    
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(detailCollecitonView)
    }
    
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.detailCollecitonView.delegate = self
        self.detailCollecitonView.dataSource = self
    }
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        detailCollecitonView.register(FirstRecommendCollectionViewCell.self, forCellWithReuseIdentifier: FirstRecommendCollectionViewCell.className)
        
    }
    
    //func bindData
 
}


extension RecommendInfoCollectionViewCell: UICollectionViewDelegate {}
extension RecommendInfoCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FirstRecommendCollectionViewCell.className,
                                                            for: indexPath) as? FirstRecommendCollectionViewCell else {return UICollectionViewCell()}
                //item.bindData(data: RecommendInfoDummy[indexPath.row])
        return item
    }
    

}
