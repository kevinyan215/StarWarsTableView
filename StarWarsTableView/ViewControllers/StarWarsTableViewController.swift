//
//  ViewController.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class StarWarsTableViewController: UIViewController {
    @IBAction func addCharacterAction(_ sender: Any) {
        print("""
            My Data Source:
            \(DataSource.starWarsCharacterList)
            """)
        
        networkManager.downloadAPICharacterAt(urlString: DataSource.starWarsNextURL)
    }
    
    @IBOutlet weak var tableView: UITableView!
    let networkManager = NetworkManager()
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        networkManager.downloadAPICharacterAt()
        networkManager.delegate = self
//        Helpers.count() //completion handler executed after main things are done..

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? StarWarsCharacterDetailViewController {
            dest.bundleContainer["name"] = DataSource.starWarsCharacterList[selectedRow!].name
            dest.bundleContainer["height"] = DataSource.starWarsCharacterList[selectedRow!].height
            dest.bundleContainer["mass"] = DataSource.starWarsCharacterList[selectedRow!].mass
            dest.bundleContainer["hairColor"] = DataSource.starWarsCharacterList[selectedRow!].hairColor
            dest.bundleContainer["skinColor"] = DataSource.starWarsCharacterList[selectedRow!].skinColor
            dest.bundleContainer["birthYear"] = DataSource.starWarsCharacterList[selectedRow!].birthYear
            dest.bundleContainer["gender"] = DataSource.starWarsCharacterList[selectedRow!].gender
        }
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        print("commit")
        //does insert need commit?
        if editingStyle == .delete {
            DataSource.starWarsCharacterList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension StarWarsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueToStarWarsCharacterDetailVC", sender: self)
    }
}

extension StarWarsTableViewController: NetworkManagerDelegate {
    func didDownloadAPICharacter() {
        tableView.reloadData()
        print(DataSource.starWarsNextURL)
    }
}
