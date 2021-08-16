//
//  Colors.swift
//  MovieApp
//
//  Created by Amir Samir on 12/11/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    
    static let white: UIColor = UIColor.white
    static let red: UIColor = UIColor.red
    static let green: UIColor = UIColor.green
    static let blue: UIColor = UIColor.blue
    static let black: UIColor = UIColor.black
    
    
    //Define All colours here
    static let navigaitonColor = UIColor(red: 35/255.0, green:52/255.0, blue: 69/255.0, alpha: 1)
    static let settingViewBackground: UIColor = UIColor(hex: "2B2B4E").withAlphaComponent(0.2)
    
    
}

extension UIColor{
    
    /// defaults colors used in as a common in all of the projects.
    public struct SALAMTECH {
        static let blue      = UIColor(named: "blue")
        static let skyBlue   = UIColor(named: "skyBlue")
        static let darkGray  = UIColor(named: "darkGray")
        static let lightGray = UIColor(named: "lightGray")
        
    }
}
