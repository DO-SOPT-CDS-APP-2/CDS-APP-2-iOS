//
//  NetworkError.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/29.
//

import Foundation

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case responseError
    case unknownError
    case notFoundError = 404
    case internalServerError = 500
    
    var errorDescription: String {
        switch self {
        case .responseError: return "RESPONSE_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .notFoundError: return "404:NOT_FOUND_ERROR"
        case .internalServerError: return "500:INTERNAL_SERVER_ERROR"
        }
    }
}
