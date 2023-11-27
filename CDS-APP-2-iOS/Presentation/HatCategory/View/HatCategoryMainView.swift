//
//  HatCategoryMainView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

final class HatCategoryMainView: UIView {
    
    //MARK: - set Properties

    lazy var realtimeBestCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: UICollectionViewLayout())
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
        
        self.setrealtimeCollectionViewLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        realtimeBestCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setHierachy() {
        self.addSubview(realtimeBestCollectionView)
    }
    
    private func setLayout() {
        realtimeBestCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(175.adjusted)
        }
    }
    
    private func setrealtimeCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8
        self.realtimeBestCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

