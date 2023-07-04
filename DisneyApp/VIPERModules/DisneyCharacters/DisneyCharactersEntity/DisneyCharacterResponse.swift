//
//  DisneyCharacter.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

struct DisneyCharacterResponse: Codable {
    
    let info: Info
    let data: [DisneyCharacterModel]
    
    enum CodingKeys: String, CodingKey {
        case info
        case data
    }
}

struct Info: Codable {
    let count: Int?
    let totalPages: Int?
    let previousPage: String?
    let nextPage: String?
}

struct DisneyCharacterModel: Codable {
    let id: Int?
    let films: [String]?
    let shortFilms: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
    let parkAttractions: [String]?
    let allies: [String]?
    let enemies: [String]?
    let sourceUrl: String?
    let name: String?
    let imageUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case films
        case shortFilms
        case tvShows
        case videoGames
        case parkAttractions
        case allies
        case enemies
        case sourceUrl
        case name
        case imageUrl
        case createdAt
        case updatedAt
        case url
    }
}
