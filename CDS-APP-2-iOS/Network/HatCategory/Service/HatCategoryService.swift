//
//  HatCategoryService.swift
//  CDS-APP-2-iOS
//
//  Created by 최서연 on 11/30/23.
//

import Foundation

final class HatCategoryService {
    // 싱글톤 객체 생성
    static let shared = HatCategoryService()
    private init() {}
    
    func makeRequestURL(categoryId: Int) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        
        let urlString = "\(baseURL)/api/v1/category/\(categoryId)"
        
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
    
    func getHatCategoryData(categoryId: Int) async throws -> HatCategoryDataModel? {
        do {
            let request = self.makeRequestURL(categoryId: categoryId)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            if httpResponse.statusCode == 200 {
                // 성공했을 때
                return parseHatCategoryData(data: data)
            }
            else if httpResponse.statusCode == 404 {
                // 카테고리 아이디가 잘못된 경우, 해당 상품이 없는 경우
                throw NetworkError.notFoundError
            }
            else if httpResponse.statusCode == 500 {
                // 서버 내부 오류
                throw NetworkError.internalServerError
            }
            else {
                // 이외의 오류
                throw NetworkError.unknownError
            }
        } catch {
            throw error
        }
    }
    
    private func parseHatCategoryData(data: Data) -> HatCategoryDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(HatCategoryDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
