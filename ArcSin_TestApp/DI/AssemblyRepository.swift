//
//  AssemblyRepository.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation

import Swinject

class AssemblyRepository: Assembly {
    func assemble(container: Container) {
        container.register(MainPageRepository.self, factory: { resolver in
            return MainPageRepository(resolver.resolve(SearchUserAPI.self)!, resolver.resolve(Database.self)!)
        })
    }
}
