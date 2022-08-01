//
//  Comic.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

struct Comic: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: ComicCover?
}
