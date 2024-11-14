//
//  Environment.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import Foundation

struct Environment {

    static var baseURL: String {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              !baseURL.isEmpty
        else {
            fatalError("BASE_URL을 찾을 수 없습니다.")
        }

        return baseURL
    }

    static var apiKey: String {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String,
              !apiKey.isEmpty
        else {
            fatalError("API_KEY를 찾을 수 없습니다.")
        }

        return apiKey
    }
}
