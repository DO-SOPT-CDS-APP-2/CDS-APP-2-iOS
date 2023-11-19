//
//  UIColor+.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

extension UIColor {
    static var point: UIColor {
        return UIColor(hex: "#FE4902")
    }
    static var white: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    static var background: UIColor {
        return UIColor(hex: "#F3F3F3")
    }
    static var border: UIColor {
        return UIColor(hex: "#DEDEDE")
    }
    static var lightGray: UIColor {
        return UIColor(hex: "#CCCCCC")
    }
    static var mediumGray: UIColor {
        return UIColor(hex: "#999999")
    }
    static var darkGray: UIColor {
        return UIColor(hex: "#666666")
    }
    static var black: UIColor {
        return UIColor(hex: "#222222")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
