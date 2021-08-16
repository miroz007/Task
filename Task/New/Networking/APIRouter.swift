//
//  APIRouter.swift
//  MovieApp
//
//  Created by Amir Samir on 12/11/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

enum APIRouter:URLRequestConvertible {
    
    case getCompanyUsers
    
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getCompanyUsers:
                return .post
                
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getCompanyUsers: return nil
            }
        }()
        
        
        let url: URL = {
            // Add base url for the request
            let baseURL:String = {
                return Environment.APIBasePath()
            }()
            // build up and return the URL for each endpoint
            let relativePath: String? = {
                switch self {
                
                case .getCompanyUsers: return "api/GetCompanyUsers/"
                    
                }
            }()
            
            var str = ""
            var url : URL!
            if let relativePath = relativePath {
                str = baseURL + relativePath 
                url = URL(string: str)
                
            }
            plog("\(url.absoluteString)")
            
            return url
        }()
        
        let encoding:ParameterEncoding = {
            return JSONEncoding.default
        }()
        let headers:[String:String]? = {
            // AUTH Header
            let token = "Bearer NhxVO_6Z_VZxfzpjmz08K5taLcpRkDRArjGQx2Ep6gImCdCOw-JZKjC1UwUJIqpYkVNljWO8XWAixbPYHxNlvB051PUuRXHtkT8QS1dGsXUwhNqGEVQWscebX4zVQMRQr6DiQK-o1VwLcmJ_HHg8AHY6fvGMZL0badL0RyjeVD4R_6NuLneuYB0MrUQ06z3Ad32LYiQPcvaYNT96YN9PODPeJY3cgD8s5N8Eh1l6MY9lzRhOE2OlBNouz2xyePCexqDZMCie2SpI5o4v33OaA_osuSU02OxeUIsZCuQ5yiw5vAWlfnW3vcPPOz_DHzzQ-pNkEhT6QHYculd7xG5ie-r3u-e6vzGFpo6eEuzC-kbhmiqcFDqBNavEX4XRzVZbQzYlzc4OF-GZNU2qHL8tuzSHxdJRjCq_0GYtnFxgFX90AI-H_Sy0M5GHo_pjS-1MkrvJph_i-_w6lMNJQNm5w5pU8gRdH0v5o5LiKtSyaB4"
            let header =   [ "Authorization" : token ]
            return header
        }()
        print("headers: \(String(describing: headers))")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try encoding.encode(urlRequest, with: params)
    }
}

