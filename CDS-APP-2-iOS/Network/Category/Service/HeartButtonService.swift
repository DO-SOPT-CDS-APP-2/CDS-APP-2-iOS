//
//  HeartButtonService.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/11/30.
//

import Foundation

class HeartButtonService {
    static let shared = HeartButtonService()
    private init() {}
    
    func makeRequestURL(memberId: Int, productId: Int) -> URLRequest {

        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        
        let urlString = "\(baseURL)/api/v1/heart/\(memberId)/\(productId)"
        
        // URL 생성
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL")
        }
        print(url)

        // URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // 헤더 추가
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func putDataTransferObject(memberId: Int, productId: Int) async throws -> HeartButtonResponseDTO? {
        do {
            let request = self.makeRequestURL(memberId: memberId, productId: productId)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            if httpResponse.statusCode == 200 {
                return parseHeartButtonData(data: data)
            } else if httpResponse.statusCode == 404 {
                throw NetworkError.notFoundError
            } else if httpResponse.statusCode == 500 {
                throw NetworkError.internalServerError
            } else {
                throw NetworkError.unknownError
            }
        } catch {
            throw error
        }
        
    }
    
    private func parseHeartButtonData(data: Data) -> HeartButtonResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(HeartButtonResponseDTO.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
