//
//  UserTarget.swift
//  MapleStory
//
//  Created by RAFA on 11/16/24.
//

import Foundation

import Alamofire

enum UserTarget {
    case getCharacterOCID(characterName: String)
    case getCharacterBasicInfo(ocid: String)
    case getCharacterPopularity(ocid: String)
}

extension UserTarget: TargetType {

    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getCharacterOCID:
            return "/maplestory/v1/id"
        case .getCharacterBasicInfo:
            return "/maplestory/v1/character/basic"
        case .getCharacterPopularity:
            return "/maplestory/v1/character/popularity"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getCharacterOCID, .getCharacterBasicInfo, .getCharacterPopularity:
            return .get
        }
    }
    
    var task: APITask {
        switch self {
        case .getCharacterOCID, .getCharacterBasicInfo, .getCharacterPopularity:
            return .requestPlain
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getCharacterOCID(let characterName):
            return ["character_name": characterName]
        case .getCharacterBasicInfo(let ocid), .getCharacterPopularity(let ocid):
            return ["ocid": ocid]
        }
    }
    
    var headers: HTTPHeaders {
        return ["x-nxopen-api-key": Environment.apiKey]
    }
}
