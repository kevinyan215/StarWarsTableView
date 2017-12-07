//
//  Parser.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

struct Parser {
    static func parseStarWarsCharacter(charDetailArray: [String:Any]) -> StarWarsCharacterModel? {
        guard
            let name = charDetailArray[StarWarsAPI.charNameKey] as? String,
            let height = charDetailArray[StarWarsAPI.charHeightKey] as? String,
            let mass = charDetailArray[StarWarsAPI.charMassKey] as? String,
            let hairColor = charDetailArray[StarWarsAPI.charHairColorKey] as? String,
            let skinColor = charDetailArray[StarWarsAPI.charSkinColorKey] as? String,
            let birthYear = charDetailArray[StarWarsAPI.charBirthYearKey] as? String,
            let gender = charDetailArray[StarWarsAPI.charGenderKey] as? String else {
            return nil
        }
        
        return StarWarsCharacterModel(name: name, height: height, mass: mass, hairColor: hairColor, skinColor: skinColor, birthYear: birthYear, gender: gender)
    }
    
    static func parseListOfStarWarCharacater(jsonResultResponse: [[String:Any]]) -> [StarWarsCharacterModel] {
        var charArray: [StarWarsCharacterModel] = []
        for eachCharacter in jsonResultResponse {
            let starWarsCharacterModel: StarWarsCharacterModel? = parseStarWarsCharacter(charDetailArray: eachCharacter)
            if let character = starWarsCharacterModel {
                charArray.append(character)
            }
        }
        return charArray
    }
}
