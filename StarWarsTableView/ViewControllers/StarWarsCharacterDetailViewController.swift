//
//  StarWarsCharacterDetailViewController.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/7/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var bundleContainer: [String:Any] = [:]
    
    override func viewDidLoad() {
        nameLabel.text = bundleContainer["name"] as! String
        heightLabel.text = bundleContainer["height"] as! String
        massLabel.text = bundleContainer["mass"] as! String
        hairColorLabel.text = bundleContainer["hairColor"] as! String
        skinColorLabel.text = bundleContainer["skinColor"] as! String
        birthYearLabel.text = bundleContainer["birthYear"] as! String
        genderLabel.text = bundleContainer["gender"] as! String

        
    }
}
