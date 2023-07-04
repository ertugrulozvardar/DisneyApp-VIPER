//
//  DisneyCharactersInteractor.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation
import SafariServices

class DisneyCharactersInteractor: DisneyCharactersPresenterToInteractorProtocol {
    
    // MARK: - Properties
    weak var presenter: DisneyCharactersInteractorToPresenterProtocol?
    var disneyCharacterService: DisneyCharacterServiceProtocol = DisneyCharacterService()
    var disneyCharacters: [DisneyCharacterModel]?
    
    // MARK: - Methods
    func fetchAllDisneyCharacters(with pageNumber: Int) {
        disneyCharacterService.fetchAllDisneyCharacters(pageNumber: pageNumber) { [weak self] result in
            switch result {
            case .success(let response):
                if self?.disneyCharacters == nil {
                    self?.disneyCharacters = response.data
                } else {
                    self?.disneyCharacters?.append(contentsOf: response.data)
                }
                self?.presenter?.successFetchAllDisneyCharacters()
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.failFetchAllDisneyCharacters()
            }
        }
    }
    
    func navigateToHomePage(with url: String) {
        guard let homePageURL = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: homePageURL)
        self.presenter?.successDirectToHomePage(with: safariViewController)
    }
}
