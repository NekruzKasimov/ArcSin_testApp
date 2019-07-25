//
//  SWAPI.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class SWAPI {
    var service: SessionManager
    
    init() {
        let config = URLSessionConfiguration.default
//        config.timeoutIntervalForRequest = 10
//        config.timeoutIntervalForResource = 10
        service = Alamofire.SessionManager(configuration: config)
    }
    
    func GenerateRequest(_ route: String, _ name: String) -> String {
        return Config.BASE_URL + "\(route)=\(name)"
    }
    
    func generateRequest(route: String, name: String) -> URLRequest {
        
        let url = GenerateRequest(route, name)
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(Config.CONTENT_TYPE.value, forHTTPHeaderField: Config.CONTENT_TYPE.name)
        
        return request
    }
    
    struct Config {
        static var BASE_URL = "https://swapi.co/api/people/?"
        static let CONTENT_TYPE = (value: "application/json",name: "Content-Type")
    }
}
