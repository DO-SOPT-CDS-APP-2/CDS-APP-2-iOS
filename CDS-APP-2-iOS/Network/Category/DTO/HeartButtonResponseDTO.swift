//
//  DTO.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/30.
//

import Foundation

// MARK: - HeartButtonResponseDTO

struct HeartButtonResponseDTO: Decodable {
    let data: DataStruct
}

// MARK: - DataStruct

struct DataStruct: Decodable {
    let isMade: Bool
}

