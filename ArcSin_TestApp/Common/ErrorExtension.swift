//
//  ErrorExtension.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation

class CommonError: LocalizedError, CustomStringConvertible {
    static let notFoundExeption = "notFoundExeption"
    static let connectionFailed = "connectionFailed"
    
    var desc: String = ""
    
    init(_ desc: String?) {
        self.desc = desc ?? ""
    }
    
    var description: String {
        return desc
    }
}

extension LocalizedError where Self: CustomStringConvertible {
    
    var errorDescription: String? {
        return description
    }
}
