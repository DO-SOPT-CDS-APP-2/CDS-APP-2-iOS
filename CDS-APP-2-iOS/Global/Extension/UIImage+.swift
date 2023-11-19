//
//  UIImage+.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//


import UIKit

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
