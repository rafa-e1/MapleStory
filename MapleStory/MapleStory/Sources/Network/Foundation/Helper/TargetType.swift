//
//  TargetType.swift
//  MapleStory
//
//  Created by RAFA on 11/16/24.
//

import Foundation

import Alamofire

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: APITask { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}
