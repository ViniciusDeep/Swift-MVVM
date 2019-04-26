//
//  Result.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 25/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let artworkUrl100: String
    let artistName: String
    let trackPrice: Double
}
