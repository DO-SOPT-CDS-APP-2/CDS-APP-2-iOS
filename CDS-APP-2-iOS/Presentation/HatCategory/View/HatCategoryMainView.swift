//
//  HatCategoryMainView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

final class HatCategoryMainView: UIView {
    
    //MARK: - set Properties
    
    private let realtimeBestViewTitle = UILabel()
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
        realtimeBestViewTitle.do {
            $0.text = "실시간 베스트"
            $0.font = UIFont.krBold(ofSize: 16.adjusted)
            $0.textColor = .black
        }
        
        realtimeBestCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setHierachy() {
        self.addSubviews(realtimeBestViewTitle,
                         realtimeBestCollectionView)
    }
    
    private func setLayout() {
        realtimeBestViewTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        realtimeBestCollectionView.snp.makeConstraints {
            $0.top.equalTo(realtimeBestViewTitle.snp.bottom).offset(7.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.trailing.equalToSuperview()
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

