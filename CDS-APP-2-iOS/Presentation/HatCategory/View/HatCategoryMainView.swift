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
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    
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
    
    //MARK: - set UI
    
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
        
        divisionLine.do {
            $0.layer.addBorder([.bottom], color: .border, width: 1)
        }
    }
    
    //MARK: - set Heirachy
    
    private func setHierachy() {
        self.addSubviews(realtimeBestViewTitle,
                         realtimeBestCollectionView,
                         divisionLine)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        realtimeBestViewTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        realtimeBestCollectionView.snp.makeConstraints {
            $0.top.equalTo(realtimeBestViewTitle.snp.bottom).offset(2.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(175.adjusted)
        }
        
        divisionLine.snp.makeConstraints {
            $0.top.equalTo(realtimeBestCollectionView.snp.bottom).offset(10.adjusted)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1.adjusted)
        }
    }
    
    //MARK: - set collectionView FlowLayout
    
    private func setrealtimeCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8
        self.realtimeBestCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

