//
//  NetworkManager.swift
//  StarWarsTableView
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

class NetworkManager {
    static func downloadAPICharacter(){
        print("download API Characters")
//        let urlString = StarWarsAPI.characterEndPoint
        let urlString = StarWarsAPI.characterListEndpoint
        guard let url = URL(string: urlString) else {
            print("something wrong with url")
            return
        }
        
        //parse and convert list of characters
        print("start task")
//        JSONSerialization.json
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)
            in
            if error != nil {
                print(error)
                print("end of error")
                return
            }
            do {
                print("session task.. inside do ")
                //parse individual star wars character
                if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
                    let parsedModel = Parser.parseStarWarsCharacter(charDetailArray: jsonArray)
                    print(parsedModel)
                }
                
                //parse list of star wars characters
                if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any], let results = jsonArray[StarWarsAPI.characterListResults] as? [[String:Any]]{
                    
//                    DispatchQueue.main.async{...} //why in main queue again?
                    let parsedModel = Parser.parseListOfStarWarCharacater(jsonResultResponse: results)
                        print(parsedModel)
                }
            }
            catch {
                //json error
                print(error.localizedDescription)
            }
        })
        task.resume()
        //copy end
    }
    
//    func downloadAPICharactersAt(url: String){}
}
