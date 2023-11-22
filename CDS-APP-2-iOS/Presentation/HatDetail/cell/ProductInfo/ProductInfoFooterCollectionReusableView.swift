//
//  ProductInfoFooterCollectionReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/22.
//

import UIKit

class ProductInfoFooterCollectionReusableView: UICollectionReusableView {
    static let identifier: String = "ProductInfoFooterCollectionReusableView"
        
    func configure() {
        backgroundColor = .clear
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
