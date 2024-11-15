//
//  NetworkError.swift
//  MapleStory
//
//  Created by RAFA on 11/15/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodeError
    case invalidResponse
    case invalidStatusCode(statusCode: Int, message: String?)
    case serverUnavailable
    case unknownError
}

extension NetworkError {

    var errorMessage: String {
        switch self {
        case .invalidResponse:
            return "잘못된 요청입니다. 다시 시도해 주세요."
        case let .invalidStatusCode(statusCode, _):
            return "서버에서 응답을 제대로 받지 못했어요. 잠시 후 다시 시도해 주세요. (오류 코드: \(statusCode))"
        case .serverUnavailable:
            return "서버에 연결할 수 없습니다. 잠시 후 다시 시도해 주세요."
        case .invalidURL, .decodeError, .unknownError:
            return "예상치 못한 오류가 발생했습니다. 잠시 후 다시 시도해 주세요."
        }
    }

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "URL 오류"
        case .decodeError:
            return "디코딩 오류"
        case .invalidResponse:
            return "요청 오류"
        case let .invalidStatusCode(statusCode, message):
            return "\(statusCode), \(message ?? "")"
        case .serverUnavailable:
            return "서버에 연결 불가능"
        case .unknownError:
            return "알 수 없는 오류"
        }
    }
}
