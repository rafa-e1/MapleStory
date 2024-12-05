//
//  UserService.swift
//  MapleStory
//
//  Created by RAFA on 11/16/24.
//

import Foundation

import Alamofire

struct UserService {

    static func getCharacterOCID(
        characterName: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let target = UserTarget.getCharacterOCID(characterName: characterName)

        NetworkService.shared.request(
            target: target,
            responseType: CharacterOCIDResponseDTO.self
        ) { result in
            switch result {
            case .success(let result):
                completion(.success(result.ocid))
            case .failure:
                completion(.failure(.invalidResponse))
            }
        }
    }

    static func getCharacterBasicInfo(
        ocid: String,
        completion: @escaping (Result<CharacterBasicInfo, NetworkError>) -> Void
    ) {
        let target = UserTarget.getCharacterBasicInfo(ocid: ocid)

        NetworkService.shared.request(
            target: target,
            responseType: CharacterBasicInfoResponseDTO.self
        ) { result in
            switch result {
            case .success(let result):
                completion(.success(result.toModel()))
            case .failure:
                completion(.failure(.invalidResponse))
            }
        }
    }

    static func getCharacterPopularity(
        ocid: String,
        completion: @escaping (Result<CharacterPopularity, NetworkError>) -> Void
    ) {
        let target = UserTarget.getCharacterPopularity(ocid: ocid)

        NetworkService.shared.request(
            target: target,
            responseType: CharacterPopularityResponseDTO.self
        ) { result in
            switch result {
            case .success(let result):
                completion(.success(result.toModel()))
            case .failure:
                completion(.failure(.invalidResponse))
            }
        }
    }
}
