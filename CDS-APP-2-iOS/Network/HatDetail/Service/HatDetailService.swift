//
//  HatDetailService.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/30.
//

import Foundation
class HatDetailService {
    // 싱글톤 객체 생성
    static let shared = HatDetailService()
    private init() {}

    func makeRequest(productID: Int) -> URLRequest {

            let baseURL = "http://13.124.244.193:8080"
            
            let urlString = "\(baseURL)/api/v1/product/\(productID)"
            
            // URL 생성
            guard let url = URL(string: urlString) else {
                fatalError("Failed to create URL")
            }

            // URLRequest 생성
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            // 헤더 추가
            let header = ["Content-Type": "application/json"]
            header.forEach {
                request.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        
            return request
        }
        
    func getHatDetailWithAPI(productID: Int) async throws -> HatDetailResponseDTO? {
        do {
            let request = self.makeRequest(productID: productID)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            
            if httpResponse.statusCode == 200 {
                return parseHatDetailData(data: data)
            }
            else if httpResponse.statusCode == 404 {
                throw NetworkError.notFoundError
            }
            else if httpResponse.statusCode == 500 {
                throw NetworkError.internalServerError
            }
            else {
                throw NetworkError.unknownError
            }
        } catch {
            throw error
        }
        
    }
        
        
    private func parseHatDetailData(data: Data) -> HatDetailResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(HatDetailResponseDTO.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }

}
