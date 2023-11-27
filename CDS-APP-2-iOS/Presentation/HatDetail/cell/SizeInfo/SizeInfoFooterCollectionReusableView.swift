//
//  SizeInfoFooterCollectionReusableView.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/27.
//

import UIKit

class SizeInfoFooterCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

        
    func configure() {
        backgroundColor = .clear
    }
    
}
