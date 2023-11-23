//
//  UIStackView+.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/22.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
