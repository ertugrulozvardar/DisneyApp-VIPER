//
//  DisneyCharacterRequest.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

enum DisneyCharacterRequest {
    case fetchAllDisneyCharacters(pageNumber: Int)
    case fetchDisneyCharacterById(characterId: Int)
    case filterDisneyCharacterByName(characterName: String)
}

extension DisneyCharacterRequest: Requestable {
    var URLpath: String {
        var urlComponents = URLComponents(string: baseURL)!
        switch self {
        case .fetchAllDisneyCharacters(pageNumber: let pageNumber):
            urlComponents.path = getURLPathName(path: .allDisneyCharacters, id: nil) ?? "/character"
            urlComponents.queryItems = [
                URLQueryItem(name: "page", value: "\(pageNumber)"),
                URLQueryItem(name: "pageSize", value: "50")
            ]
            return urlComponents.string!
        case .fetchDisneyCharacterById(characterId: let characterId):
            urlComponents.path = getURLPathName(path: .disneyCharacterById, id: characterId) ?? "/character/\(characterId)"
            return urlComponents.string!
        case .filterDisneyCharacterByName(characterName: let characterName):
            urlComponents.path = getURLPathName(path: .filterDisneyCharacterByName, id: nil) ?? "/character"
            urlComponents.queryItems = [
                URLQueryItem(name: "name", value: characterName),
            ]
            return urlComponents.string!
        }
    }
    
    var URLparameters: Data? {
        switch self {
        case .fetchAllDisneyCharacters,
                .fetchDisneyCharacterById,
                .filterDisneyCharacterByName:
            return nil
        }
    }
}
