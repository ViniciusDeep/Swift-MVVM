//
//  Service.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    public func fetchArtist(searchTerm: String, completion: @escaping ([Result], Error?) -> () ){
        let urlString: String = "https://itunes.apple.com/search?term=\(searchTerm)"
        guard let url = URL(string: urlString) else {return}
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, _, error) in
            guard let data = data else {return}
            if let error = error {
                print("Failed", error)
                completion([], error)
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonError {
                print("Fatal Error", jsonError)
                completion([], jsonError)
            }
            }.resume()
    }
}
