//
//  CharacterDTO.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

struct InfoDTO: Codable {
    var count: Int
    var pages: Int
    var next: String?
}

struct CharacterDTO: Codable {
    var image: String
    var name: String
}

struct ListDTO: Codable {
    var info: InfoDTO
    var results: [CharacterDTO]
}
