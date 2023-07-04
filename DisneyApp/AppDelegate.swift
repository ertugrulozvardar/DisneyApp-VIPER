//
//  AppDelegate.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let disneyCharactersModule = DisneyCharactersRouter.generateModule()
        let navigationController = UINavigationController.init(rootViewController: disneyCharactersModule)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()*/
        
        return true
    }
}

