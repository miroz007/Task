//
//  Environment.swift
//  MovieApp
//
//  Created by Amir Samir on 12/11/18.


import Foundation

enum Server {
    case developement
    case testing
    case production
}

class Environment {
        
    static let server:Server =  .production
    
    // To print the log set true.
    static let imageBaseUrl = ""
    static let debug:Bool  =  true
    
    class func APIBasePath() -> String {
        switch self.server {
            case .production:
               return "http://5.9.120.72:4321/"
            
            case .testing:
               return "http://5.9.120.72:4321/"
            
            case .developement:
                return "http://5.9.120.72:4321/"
        }
    }
    
    
}


