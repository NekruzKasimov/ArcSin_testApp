//
//  SwinjectStoryboard+Extension.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

var assembler: Assembler!

extension SwinjectStoryboard {
    @objc class func setup() {
        assembler = Assembler(_: [
            AssemblyViewModel(),
            AssemblyModule(),
            AssemblyRepository()
            ], container: defaultContainer)
        
        defaultContainer.storyboardInitCompleted(MainPageViewController.self) { _, controller in
            controller.viewModel = assembler.resolver.resolve(MainPageViewModel.self)!
        }
    }
}
