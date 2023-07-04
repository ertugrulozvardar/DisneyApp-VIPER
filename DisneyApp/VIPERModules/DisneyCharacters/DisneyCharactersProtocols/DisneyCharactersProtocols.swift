//
//  DisneyCharactersProtocols.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation
import UIKit
import SafariServices

// Communication between Presenter & View Layers - Presenter Calls, View Listens
protocol DisneyCharactersPresenterToViewProtocol: AnyObject {
    func displayAllDisneyCharacters()
    func displayError()
    func displayHomePage(with safariController: SFSafariViewController)
    func displayHomePageError()
}

// Communication between Interactor & Presenter Layers - Interactor Calls, Presenter Listens
protocol DisneyCharactersInteractorToPresenterProtocol: AnyObject {
    func successFetchAllDisneyCharacters()
    func failFetchAllDisneyCharacters()
    func successDirectToHomePage(with controller: SFSafariViewController)
}

// Communication between Presenter & Interactor Layers - Presenter Calls, Interactor Listens
protocol DisneyCharactersPresenterToInteractorProtocol: AnyObject {
    var presenter: DisneyCharactersInteractorToPresenterProtocol? { get set }
    var disneyCharacters: [DisneyCharacterModel]? { get }
    
    func fetchAllDisneyCharacters(with pageNumber: Int)
    func navigateToHomePage(with url: String)
}

// Communication between View & Presenter Layers - View Calls, Presenter Listens
protocol DisneyCharactersViewToPresenterProtocol: AnyObject {
    var view: DisneyCharactersPresenterToViewProtocol? { get set }
    var interactor: DisneyCharactersPresenterToInteractorProtocol? { get set }
    var router: DisneyCharactersPresenterToRouterProtocol? { get set }
    
    func updateUI(using currentPageNumber: Int)
    func getAllDisneyCharactersCount() -> Int?
    func getAllDisneyCharacters() -> [DisneyCharacterModel]?
    func getAllDisneyCharacters(at index: Int) -> DisneyCharacterModel?
    func didSelectDisneyCharacter(with id: Int)
    func requestNavigateToHomePage(with url: String)
}

// Communication between Presenter & Router Layers - Presenter Calls, Router Listens
protocol DisneyCharactersPresenterToRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func navigateToCharacterDetails(forCharacterId id: Int)
    static func generateModule() -> UIViewController
}
