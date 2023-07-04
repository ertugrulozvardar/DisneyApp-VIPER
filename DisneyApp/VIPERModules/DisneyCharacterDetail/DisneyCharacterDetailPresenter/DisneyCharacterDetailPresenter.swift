//
//  DisneyCharacterDetailPresenter.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import Foundation

class DisneyCharacterDetailPresenter: DisneyCharacterDetailViewToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: DisneyCharacterDetailPresenterToViewProtocol?
    var interactor: DisneyCharacterDetailPresenterToInteractorProtocol?
    var router: DisneyCharacterDetailPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateUI(using characterId: Int) {
        interactor?.fetchDisneyCharacterById(characterId: characterId)
    }
    
    func getDisneyCharacterFilmsCount() -> Int? {
        return interactor?.disneyCharacter?.films?.count
    }
    
    func getDisneyCharacterShortFilmsCount() -> Int? {
        return interactor?.disneyCharacter?.shortFilms?.count
    }
    
    func getDisneyCharacterTvShowsCount() -> Int? {
        return interactor?.disneyCharacter?.tvShows?.count
    }
    
    func getDisneyCharacter() -> DisneyCharacterModel? {
        return interactor?.disneyCharacter
    }
}
// MARK: - Communication between the Interactor & Presenter
extension DisneyCharacterDetailPresenter: DisneyCharacterDetailInteractorToPresenterProtocol {
    func successFetchDisneyCharacter() {
        view?.displayDisneyCharacterDetail()
    }
    
    func failFetchDisneyCharacter() {
        view?.displayError()
    }
}
