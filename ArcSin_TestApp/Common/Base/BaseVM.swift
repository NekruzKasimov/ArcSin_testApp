//
//  BaseVM.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RxSwift

class BaseVM<T> {
    var repository: T
    lazy var disposable: DisposeBag = {
        return DisposeBag()
    }()
    
    init(_ repository: T) {
        self.repository = repository
    }
}
