//
//  Character.swift
//  MapleStory
//
//  Created by RAFA on 11/16/24.
//

import Foundation

struct CharacterOCID {

    let ocid: String
}

struct CharacterBasicInfo: Decodable {

    let date: String?
    let characterName: String
    let worldName: String
    let characterGender: String
    let characterClass: String
    let characterClassLevel: String
    let characterLevel: Int
    let characterExp: Int64
    let characterExpRate: String
    let characterGuildName: String?
    let characterImage: String?
    let characterDateCreate: String
    let accessFlag: String
    let liberationQuestClearFlag: String

    enum CodingKeys: String, CodingKey {
        case date
        case characterName = "character_name"
        case worldName = "world_name"
        case characterGender = "character_gender"
        case characterClass = "character_class"
        case characterClassLevel = "character_class_level"
        case characterLevel = "character_level"
        case characterExp = "character_exp"
        case characterExpRate = "character_exp_rate"
        case characterGuildName = "character_guild_name"
        case characterImage = "character_image"
        case characterDateCreate = "character_date_create"
        case accessFlag = "access_flag"
        case liberationQuestClearFlag = "liberation_quest_clear_flag"
    }
}

struct CharacterPopularity: Decodable {

    let popularity: Int
}
