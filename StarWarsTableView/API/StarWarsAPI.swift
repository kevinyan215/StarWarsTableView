//
//  StarWarsAPI.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

struct StarWarsAPI {
    static let characterListEndpoint: String = "https://swapi.co/api/people/" //or ... https://swapi.co/api/people/?page=1... https://swapi.co/api/people/?page= + number
    static let characterEndPoint = "https://swapi.co/api/people/1" //https://swapi.co/api/people/ + number
    
    
//    static let characterIdKey = ""
    static let charNameKey = "name"
    static let charHeightKey = "height"
    static let charMassKey = "mass"
    static let charHairColorKey = "hair_color"
    static let charSkinColorKey = "skin_color"
    static let charEyeColorKey = "eye_color"
    static let charBirthYearKey = "birth_year"
    static let charGenderKey = "gender"

}
