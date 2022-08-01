//
//  ComicDataSource.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

struct ComicDataSource: Codable {
    
    let comics: [Comic]?
    
    enum CodingKeys: String, CodingKey{
        case comics = "results"
    }
    
}
