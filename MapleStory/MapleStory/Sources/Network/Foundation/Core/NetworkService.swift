//
//  NetworkService.swift
//  MapleStory
//
//  Created by RAFA on 11/16/24.
//

import Foundation

import Alamofire

final class NetworkService {

    static let shared = NetworkService()

    private init() { }

    func request<T: Decodable>(
        target: TargetType,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "\(target.baseURL)\(target.path)")?.absoluteString else {
            completion(.failure(.invalidURL))
            return
        }

        AF.request(
            url,
            method: target.method,
            parameters: target.parameters,
            encoding: URLEncoding.default,
            headers: target.headers
        )
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure:
                let statusCode = response.response?.statusCode ?? 0
                let message = response.error?.localizedDescription
                completion(.failure(.invalidStatusCode(statusCode: statusCode, message: message)))
            }
        }
    }
}
