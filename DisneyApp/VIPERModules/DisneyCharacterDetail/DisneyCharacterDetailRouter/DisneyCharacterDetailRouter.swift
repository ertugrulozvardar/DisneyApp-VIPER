//
//  DisneyCharacterDetailRouter.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import Foundation
import UIKit

class DisneyCharacterDetailRouter: DisneyCharacterDetailPresenterToRouterProtocol {
    
    class func generateModule(characterId: Int) -> DisneyCharacterDetailViewController {
        
        let view = DisneyCharacterDetailViewController()
        let interactor: DisneyCharacterDetailPresenterToInteractorProtocol = DisneyCharacterDetailInteractor()
        let presenter: DisneyCharacterDetailViewToPresenterProtocol & DisneyCharacterDetailInteractorToPresenterProtocol = DisneyCharacterDetailPresenter()
        let router: DisneyCharacterDetailPresenterToRouterProtocol = DisneyCharacterDetailRouter()
        
        view.characterId = characterId
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
