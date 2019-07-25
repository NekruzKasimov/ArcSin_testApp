//
//  AssemblyViewModel.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import Swinject

class AssemblyViewModel: Assembly {
    func assemble(container: Container) {
        container.register(MainPageViewModel.self, factory: { resolver in
            return MainPageViewModel(resolver.resolve(MainPageRepository.self)!)
            
        })
    }
}
