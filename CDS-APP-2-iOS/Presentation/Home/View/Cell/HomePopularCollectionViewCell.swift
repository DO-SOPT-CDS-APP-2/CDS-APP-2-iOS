//
//  HomePopularCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/29.
//

import UIKit

import SnapKit
import Then

final class HomePopularCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Components

    private let productImageView = UIImageView()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setHierachy()
        self.setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - set Hierachy

    private func setHierachy() {
        self.contentView.addSubview(productImageView)
    }

    //MARK: - set Layout

    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.height.equalTo(144.adjusted)
            $0.width.equalTo(122.adjusted)
            $0.leading.top.equalToSuperview()
        }
    }
    
    func configureCell(image: UIImage) {
        productImageView.image = image
    }
}
