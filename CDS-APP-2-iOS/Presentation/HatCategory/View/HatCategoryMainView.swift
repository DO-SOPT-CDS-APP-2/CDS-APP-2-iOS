//
//  HatCategoryMainView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

final class HatCategoryMainView: UIView {
    
    //MARK: - set Properties
    
    private let collectionViewLayout = HatCategoryLayoutFactory.createLayout()
    lazy var mainCollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: collectionViewLayout)
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        mainCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func setHierachy() {
        self.addSubview(mainCollectionView)
    }
    
    private func setLayout() {
        mainCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
