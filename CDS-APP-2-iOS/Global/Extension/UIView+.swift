//
//  UIView+.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//


import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}