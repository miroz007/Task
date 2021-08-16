//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Amir on 1/27/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private let disposeBag = DisposeBag()
    
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = .white
        
        return navigationController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        Application.setRoot()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        return true
    }
    
}

