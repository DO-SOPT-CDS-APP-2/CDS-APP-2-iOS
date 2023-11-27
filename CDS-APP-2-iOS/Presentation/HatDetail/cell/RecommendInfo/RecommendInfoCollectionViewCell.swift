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
    
    private let recommendLabel = UILabel()
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
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        detailCollecitonView.backgroundColor = .clear
        
        recommendLabel.do {
            $0.text = "타입서비스의 이 상품은 어때요?"
            $0.font = .krBold(ofSize: 18.adjusted)
        }
        let brandString = NSMutableAttributedString(string: recommendLabel.text ?? "")
        brandString.addAttribute(.foregroundColor, value: UIColor.point, range: NSRange(location: 0, length: 5))
        brandString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 5, length: brandString.length - 5))
        recommendLabel.attributedText = brandString
        
        eventLabel.do {
            $0.text = "관련 이벤트"
            $0.font = .krBold(ofSize: 18.adjusted)
            $0.textColor = .black
        }
    }
    
    
    // MARK: - Set Layout
    
    private func setLayout() {
        recommendLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        detailCollecitonView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(recommendLabel.snp.leading)
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

        return item
    }
    

}
