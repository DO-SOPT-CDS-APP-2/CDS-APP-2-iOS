//
//  NSObject+.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
