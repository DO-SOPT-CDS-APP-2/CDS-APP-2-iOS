//
//  InquireInfoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

import SnapKit
import Then

final class InquireInfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    
    private let inquireDummy = InquireList.inquiredummy()
    private let inquireImage = UIImageView()
    
    private let detailColletionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 335.adjusted, height: 45.adjusted)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
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
    
    // MARK: - set UI
    
    private func setUI() {
        contentView.backgroundColor = .white
        detailColletionView.do {
            $0.backgroundColor = .white
            $0.showsHorizontalScrollIndicator = false
        }

        inquireImage.do {
            $0.image = ImageLiterals.img.imgInquire
        }
    }
    
    // MARK: - set Hierachy

    private func setHierachy() {
        contentView.addSubviews(inquireImage,
                                detailColletionView)
    }
    
    // MARK: - set Layout
    
    private func setLayout() {
        inquireImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }

        detailColletionView.snp.makeConstraints {
            $0.top.equalTo(inquireImage.snp.bottom).offset(10.adjusted)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(500.adjusted)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }

    }
    
    // MARK: - set Delegate
    
    private func setDelegate() {
        self.detailColletionView.delegate = self
        self.detailColletionView.dataSource = self
    }
    
    
    // MARK: - set CollectionView
    
    private func setupCollectionView() {
        detailColletionView.register(ListCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ListCollectionViewCell.className)
    }
}

extension InquireInfoCollectionViewCell: UICollectionViewDelegate {}
extension InquireInfoCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inquireDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.className,
                                                            for: indexPath) as? ListCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(item: inquireDummy[indexPath.row])
        return item
    }
}
