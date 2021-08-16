//
//  UIStoryboard+Controllers.swift
//  MovieApp
//
//  Created by Anshul Shah on 12/11/18.
//  Copyright © 2018 Anshul Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static var Main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
   
}


extension UIStoryboard {
    
    //homeVC
    var usersVC: UsersVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: UsersVC.self)) as? UsersVC else {
            fatalError(String(describing: UsersVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    
   
    

}
