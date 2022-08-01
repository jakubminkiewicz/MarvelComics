//
//  ComicBaseData.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

struct ComicBaseData: Codable {
    let responseCode: Int?
    let dataSource: ComicDataSource?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "code"
        case dataSource = "data"
    }
}
