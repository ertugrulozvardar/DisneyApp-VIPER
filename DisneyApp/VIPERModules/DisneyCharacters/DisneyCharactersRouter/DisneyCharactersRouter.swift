//
//  DisneyCharactersRouter.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation
import UIKit

class DisneyCharactersRouter: DisneyCharactersPresenterToRouterProtocol {
    
    weak var viewController: UIViewController?
    
    class func generateModule() -> UIViewController {
        
        let view = DisneyCharactersViewController()
        let interactor: DisneyCharactersPresenterToInteractorProtocol = DisneyCharactersInteractor()
        let presenter: DisneyCharactersViewToPresenterProtocol & DisneyCharactersInteractorToPresenterProtocol = DisneyCharactersPresenter()
        let router: DisneyCharactersPresenterToRouterProtocol = DisneyCharactersRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return navigation
    }
    
    func navigateToCharacterDetails(forCharacterId id: Int) {
        let characterDetailsModuleViewController = DisneyCharacterDetailRouter.generateModule(characterId: id)
        viewController?.navigationController?.pushViewController(characterDetailsModuleViewController, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
