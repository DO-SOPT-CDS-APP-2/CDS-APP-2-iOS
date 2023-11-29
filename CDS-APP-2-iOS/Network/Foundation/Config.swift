//
//  a.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/20.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let apiKey = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict =  Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
