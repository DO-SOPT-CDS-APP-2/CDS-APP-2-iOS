//
//  UIButton+.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/22.
//

import UIKit

extension UIButton {
    func setRoundBorder(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
}
