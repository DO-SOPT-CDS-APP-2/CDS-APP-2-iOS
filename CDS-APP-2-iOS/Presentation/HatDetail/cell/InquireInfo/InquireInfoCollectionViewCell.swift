//
//  InquireInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

import SnapKit
import Then

class InquireInfoCollectionViewCell: UICollectionViewCell {
    
    private let inquireDummy = InquireList.inquiredummy()
    private let inquireImage = UIImageView()
    private let detailColletionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 335, height: 45)
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
        contentView.backgroundColor = .white
        detailColletionView.backgroundColor = .white
        detailColletionView.showsHorizontalScrollIndicator = false

        inquireImage.do {
            $0.image = ImageLiterals.img.imgInquire
        }
    }
    
    // MARK: - Set Hierachy
    
    
    private func setHierachy() {
        contentView.addSubviews(inquireImage, detailColletionView)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {

        inquireImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }

        detailColletionView.snp.makeConstraints {
            $0.top.equalTo(inquireImage.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(500.adjusted)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }

    }
    
    // MARK: - Set Delegate
    
    private func setDelegate() {
        self.detailColletionView.delegate = self
        self.detailColletionView.dataSource = self
    }
    
    
    // MARK: - Set CollectionView
    
    private func setupCollectionView() {
        detailColletionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.className)
    }
}

extension InquireInfoCollectionViewCell: UICollectionViewDelegate {}
extension InquireInfoCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.className,
                                                            for: indexPath) as? ListCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(item: inquireDummy[indexPath.row])
        return item
    }
}
