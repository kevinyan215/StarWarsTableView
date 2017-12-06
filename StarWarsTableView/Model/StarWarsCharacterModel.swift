//
//  StarWarsCharacterModel.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

struct StarWarsCharacterModel {
    let name: String, height: String, mass: String, hairColor: String, skinColor: String, birthYear: String, gender: String
    
    init(name: String, height: String, mass: String, hairColor: String, skinColor: String, birthYear: String, gender: String){
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.birthYear = birthYear
        self.gender = gender
    }
}
