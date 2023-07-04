//
//  DisneyCharacterService.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

protocol DisneyCharacterServiceProtocol {
    mutating func fetchAllDisneyCharacters(pageNumber: Int, completion: @escaping (Result<DisneyCharacterResponse, NetworkError>) -> Void)
    mutating func fetchDisneyCharacterById(id: Int, completion: @escaping (Result<DisneyCharacterDetailResponse, NetworkError>) -> Void)
    mutating func filterDisneyCharacterByName(name: String, completion: @escaping (Result<DisneyCharacterResponse, NetworkError>) -> Void)
}

struct DisneyCharacterService: DisneyCharacterServiceProtocol {
    
    private let network = Network()
    
    mutating func fetchAllDisneyCharacters(pageNumber: Int, completion: @escaping (Result<DisneyCharacterResponse, NetworkError>) -> Void) {
        network.performRequest(request: DisneyCharacterRequest.fetchAllDisneyCharacters(pageNumber: pageNumber), completion: completion)
    }
    
    mutating func fetchDisneyCharacterById(id: Int, completion: @escaping (Result<DisneyCharacterDetailResponse, NetworkError>) -> Void) {
        network.performRequest(request: DisneyCharacterRequest.fetchDisneyCharacterById(characterId: id), completion: completion)
    }
    
    mutating func filterDisneyCharacterByName(name: String, completion: @escaping (Result<DisneyCharacterResponse, NetworkError>) -> Void) {
        network.performRequest(request: DisneyCharacterRequest.filterDisneyCharacterByName(characterName: name), completion: completion)
    }
}
