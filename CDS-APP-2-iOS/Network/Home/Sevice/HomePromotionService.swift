//
//  HomePromotionService.swift
//  CDS-APP-2-iOS
//
//  Created by 박윤빈 on 2023/11/30.
//

import UIKit

class HomePromotionService {
    static let shared = HomePromotionService()
    private init() {}
    
    func makeRequest() -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        guard let url = URL(string: baseURL + StringLiterals.Home.thirdSection.categoryURL) else {
            fatalError("Failed to create URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getPromotionData() async throws -> PromotionDataModel? {
        do {
            let request = self.makeRequest()
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return parsePromotionData(data: data)
        } catch {
            throw error
        }
    }
    
    func parsePromotionData(data: Data) -> PromotionDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(PromotionDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
