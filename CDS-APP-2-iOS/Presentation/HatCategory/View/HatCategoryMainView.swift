//
//  HatCategoryMainView.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/25/23.
//

import UIKit

final class HatCategoryMainView: UIView {
    
    //MARK: - set Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let realtimeBestViewTitle = UILabel()
    lazy var realtimeBestCollectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    lazy var productFilterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    lazy var detailProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
        
        self.setRealtimeCollectionViewLayout()
        self.setProductFilterCollectionViewLayout()
        self.setDetailProductCollectionViewLayout()
        
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set UI
    
    private func setUI() {
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }

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
        
        productFilterCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsHorizontalScrollIndicator = false
        }
        
        detailProductCollectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    //MARK: - set Heirachy
    
    private func setHierachy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(realtimeBestViewTitle,
                                realtimeBestCollectionView,
                                divisionLine,
                                productFilterCollectionView,
                                detailProductCollectionView)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1400)
        }
        
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
        
        productFilterCollectionView.snp.makeConstraints {
            $0.top.equalTo(divisionLine.snp.bottom).offset(13.adjusted)
            $0.leading.equalToSuperview().inset(12.adjusted)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(31.adjusted)
        }
        
        detailProductCollectionView.snp.makeConstraints {
            $0.top.equalTo(productFilterCollectionView.snp.bottom).offset(13.adjusted)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(658)
        }
    }
    
    //MARK: - set collectionView FlowLayout
    
    private func setRealtimeCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8
        self.realtimeBestCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setProductFilterCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 6
        self.productFilterCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setDetailProductCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 1) / 2 , height: 314.adjusted)
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 30
        self.detailProductCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

