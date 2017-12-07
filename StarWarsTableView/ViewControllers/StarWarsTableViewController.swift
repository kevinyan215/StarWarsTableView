//
//  ViewController.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class StarWarsTableViewController: UIViewController {
    @IBAction func action(_ sender: Any) {
        print("""
            My Data Source:
            \(DataSource.starWarsCharacterList)
            """)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        let networkManager = NetworkManager()
        networkManager.downloadAPICharacter()
        networkManager.delegate = self
//        Helpers.count() //completion handler executed after main things are done..

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension StarWarsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.starWarsCharacterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarWarsTableViewCell") as? StarWarsTableViewCell else {
            print("guard else.. not StarWarsTableViewCell")
            return UITableViewCell()
        }
        
        cell.characterNameLabel.text = DataSource.starWarsCharacterList[indexPath.row].name
        cell.characterGenderLabel.text = DataSource.starWarsCharacterList[indexPath.row].gender
        cell.characterBirthYearLabel.text = DataSource.starWarsCharacterList[indexPath.row].birthYear
        
        return cell
    }
}

extension StarWarsTableViewController: NetworkManagerDelegate {
    func didDownloadAPICharacter() {
        tableView.reloadData()
    }
}

