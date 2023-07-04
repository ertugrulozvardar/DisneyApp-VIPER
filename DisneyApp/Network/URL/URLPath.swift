//
//  URLPath.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

enum URLPath {
    case allDisneyCharacters
    case disneyCharacterById
    case filterDisneyCharacterByName
}

func getURLPathName(path: URLPath, id: Int?) -> String? {
    switch path {
    case .allDisneyCharacters:
        return "/character"
    case .disneyCharacterById:
        return "/character/\(id ?? 1)"
    case .filterDisneyCharacterByName:
        return "/character"
    }
}
