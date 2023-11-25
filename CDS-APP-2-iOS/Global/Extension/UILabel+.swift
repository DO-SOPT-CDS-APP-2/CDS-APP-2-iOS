//
//  UILabel+.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/25.
//

import UIKit

extension UILabel {
    func asColor(targetString: String, color: UIColor?, font: UIFont?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
}
