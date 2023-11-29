//
//  HomeBrandBigCollectionViewCell.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class HomeBrandBigCollectionViewCell: UICollectionViewCell {

    // MARK: - UI Components

    private let brandImageView = UIImageView()

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
        self.contentView.addSubview(brandImageView)
    }

    //MARK: - set Layout

    private func setLayout() {
        brandImageView.snp.makeConstraints {
            $0.height.equalTo(324.adjusted)
            $0.width.equalTo(264.adjusted)
            $0.leading.top.equalToSuperview()
        }
    }
    
    func configureCell(image: UIImage) {
        brandImageView.image = image
    }
}
