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
        let urlString = StarWarsAPI.characterEndPoint
        guard let url = URL(string: urlString) else {
            print("something wrong with url")
            return
        }
//        let urlRequest = URLRequest(url: url)
//        let task2: URLSessionDataTask = URLSession.shared.dataTask(with: url) //doing it w/o completion handler?
//        print(task2)
        
        print("start task")
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)
            in
            print(data!)
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
                    let parsedModel = Parser.parseStarWarsCharacter(charDetailArray: jsonArray)
                    print(parsedModel)
                }
            }
            catch {
                
            }
        })
        
        task.resume()

    }
    
//    func downloadAPICharactersAt(url: String){}
}
