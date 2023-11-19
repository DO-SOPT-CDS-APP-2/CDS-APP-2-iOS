//
//  UIFont+.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import UIKit

extension UIFont {
    
    static func krRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeo-Regular", size: size)!
    }
    
    static func krMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeo-Medium", size: size)!
    }
    
    static func krBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeo-Bold", size: size)!
    }
    
    static func krSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: size)!
    }
    static func enDisplayBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "GmarketSansTTFBold", size: size)!
    }
    
    static func enDisplayLight(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "GmarketSansTTFLight", size: size)!
    }
    
    static func enDisplayMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "GmarketSansTTFMedium", size: size)!
    }
  
}
