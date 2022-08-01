//
//  ComicCover.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

struct ComicCover: Codable {
    
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
}
