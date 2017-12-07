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
            let name = charDetailArray[StarWarsAPI.CharacterDetailKeys.charNameKey] as? String,
            let height = charDetailArray[StarWarsAPI.CharacterDetailKeys.charHeightKey] as? String,
            let mass = charDetailArray[StarWarsAPI.CharacterDetailKeys.charMassKey] as? String,
            let hairColor = charDetailArray[StarWarsAPI.CharacterDetailKeys.charHairColorKey] as? String,
            let skinColor = charDetailArray[StarWarsAPI.CharacterDetailKeys.charSkinColorKey] as? String,
            let birthYear = charDetailArray[StarWarsAPI.CharacterDetailKeys.charBirthYearKey] as? String,
            let gender = charDetailArray[StarWarsAPI.CharacterDetailKeys.charGenderKey] as? String else {
            return nil
        }
        
        return StarWarsCharacterModel(name: name, height: height, mass: mass, hairColor: hairColor, skinColor: skinColor, birthYear: birthYear, gender: gender)
    }
    
    static func parseStarWarCharacaterList(jsonResultResponse: [[String:Any]]) -> [StarWarsCharacterModel] {
        var charArray: [StarWarsCharacterModel] = []
        for eachCharacter in jsonResultResponse {
            let starWarsCharacterModel: StarWarsCharacterModel? = parseStarWarsCharacter(charDetailArray: eachCharacter)
            if let character = starWarsCharacterModel {
                charArray.append(character)
                DataSource.starWarsCharacterList.append(character)
            }
        }
        return charArray
    }
}
