//
//  AssemblyModule.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import Swinject

class AssemblyModule: Assembly {
    func assemble(container: Container) {
        container.register(SearchUserAPI.self, factory: { resolver in
            return SearchUserAPI()
        })
        
        container.register(Database.self, factory: { resolver in
            return Database()
        })

    }
}
