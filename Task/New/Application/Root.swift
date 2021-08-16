////
////  AppCoordinator.swift
////  MarvelApp
////
////  Created by Amir Samir on 27/01/21.
////  Copyright © 2018 Amir Samir. All rights reserved.
////
//

import UIKit



extension AppDelegate {
    
    
    func setRoot(){
        self.navigationController.setViewControllers([UIStoryboard.Main.usersVC], animated: true)
        window?.rootViewController = self.navigationController
        window?.makeKeyAndVisible()
        
 
        
        //
        //        UIApplication.shared.windows.first?.rootViewController = Application.isLoggedIn() ? self.navigationController : self.AuthnavigationController
        //        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
