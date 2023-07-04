//
//  DisneyCharacterDetailResponse.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

struct DisneyCharacterDetailResponse: Codable {
    
    let info: Info
    let data: DisneyCharacterModel
    
    enum CodingKeys: String, CodingKey {
        case info
        case data
    }
}
