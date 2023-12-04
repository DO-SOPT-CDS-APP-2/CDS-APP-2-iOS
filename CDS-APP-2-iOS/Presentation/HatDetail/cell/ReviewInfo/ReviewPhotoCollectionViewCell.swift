//
//  ReviewPhotoCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/29.
//

import UIKit

// MARK: - ReviewInfo = 리뷰 사진 CollectionView

final class ReviewPhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - set Properties
    private let productImage = UIImageView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set Hierachy
    
    private func setHierachy() {
        contentView.addSubview(productImage)
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        productImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func bindData(item: ReviewPhotoItem) {
        productImage.image = item.image
    }
}
