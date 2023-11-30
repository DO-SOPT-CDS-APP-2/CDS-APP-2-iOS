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
            static let baseURL = "http://13.124.244.193:8080/api/v1"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict =  Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
