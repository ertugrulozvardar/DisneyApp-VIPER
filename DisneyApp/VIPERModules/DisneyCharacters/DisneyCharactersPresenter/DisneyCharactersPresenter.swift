//
//  DisneyCharactersPresenter.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation
import SafariServices

class DisneyCharactersPresenter: DisneyCharactersViewToPresenterProtocol {
    
    // MARK: - Properties
    weak var view: DisneyCharactersPresenterToViewProtocol?
    var interactor: DisneyCharactersPresenterToInteractorProtocol?
    var router: DisneyCharactersPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateUI(using currentPageNumber: Int) {
        interactor?.fetchAllDisneyCharacters(with: currentPageNumber)
    }
    
    func getAllDisneyCharactersCount() -> Int? {
        return interactor?.disneyCharacters?.count
    }
    
    func getAllDisneyCharacters() -> [DisneyCharacterModel]? {
        return interactor?.disneyCharacters
    }
    
    func getAllDisneyCharacters(at index: Int) -> DisneyCharacterModel? {
        return interactor?.disneyCharacters?[index]
    }
    
    func didSelectDisneyCharacter(with id: Int) {
        router?.navigateToCharacterDetails(forCharacterId: id)
    }
    
    func requestNavigateToHomePage(with url: String) {
        interactor?.navigateToHomePage(with: url)
    }
}

// MARK: - Communication between the Interactor & Presenter
extension DisneyCharactersPresenter: DisneyCharactersInteractorToPresenterProtocol {
    
    func successFetchAllDisneyCharacters() {
        view?.displayAllDisneyCharacters()
    }
    
    func failFetchAllDisneyCharacters() {
        view?.displayError()
    }
    
    func successDirectToHomePage(with controller: SFSafariViewController) {
        view?.displayHomePage(with: controller)
    }
}
