//
//  DisneyCharacterDetailProtocols.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import Foundation

import Foundation
import UIKit

// Communication between Presenter & View Layers - Presenter Calls, View Listens
protocol DisneyCharacterDetailPresenterToViewProtocol: AnyObject {
    func displayDisneyCharacterDetail()
    func displayError()
}

// Communication between Interactor & Presenter Layers - Interactor Calls, Presenter Listens
protocol DisneyCharacterDetailInteractorToPresenterProtocol: AnyObject {
    func successFetchDisneyCharacter()
    func failFetchDisneyCharacter()
}

// Communication between Presenter & Interactor Layers - Presenter Calls, Interactor Listens
protocol DisneyCharacterDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DisneyCharacterDetailInteractorToPresenterProtocol? { get set }
    var disneyCharacter: DisneyCharacterModel? { get }
    
    func fetchDisneyCharacterById(characterId: Int)
}

// Communication between View & Presenter Layers - View Calls, Presenter Listens
protocol DisneyCharacterDetailViewToPresenterProtocol: AnyObject {
    var view: DisneyCharacterDetailPresenterToViewProtocol? { get set }
    var interactor: DisneyCharacterDetailPresenterToInteractorProtocol? { get set }
    var router: DisneyCharacterDetailPresenterToRouterProtocol? { get set }
    
    func updateUI(using characterId: Int)
    func getDisneyCharacterFilmsCount() -> Int?
    func getDisneyCharacterShortFilmsCount() -> Int?
    func getDisneyCharacterTvShowsCount() -> Int?
    func getDisneyCharacter() -> DisneyCharacterModel?
}

// Communication between Presenter & Router Layers - Presenter Calls, Router Listens
protocol DisneyCharacterDetailPresenterToRouterProtocol: AnyObject {
    static func generateModule(characterId: Int) -> DisneyCharacterDetailViewController
}
