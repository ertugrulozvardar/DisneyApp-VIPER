//
//  DisneyCharacterDetailInteractor.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import Foundation

class DisneyCharacterDetailInteractor: DisneyCharacterDetailPresenterToInteractorProtocol {
    
    // MARK: - Properties
    weak var presenter: DisneyCharacterDetailInteractorToPresenterProtocol?
    var disneyCharacterService: DisneyCharacterServiceProtocol = DisneyCharacterService()
    var disneyCharacter: DisneyCharacterModel?
    
    // MARK: - Methods
    func fetchDisneyCharacterById(characterId: Int) {
        disneyCharacterService.fetchDisneyCharacterById(id: characterId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.disneyCharacter = response.data
                self?.presenter?.successFetchDisneyCharacter()
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.failFetchDisneyCharacter()
            }
        }
    }
}
