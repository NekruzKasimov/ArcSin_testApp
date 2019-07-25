//
//  BaseRepository.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RxSwift

class BaseRepository<T, D: BaseDatabase> {
    var service: T
    var db: D? = nil
    
    var disposable: DisposeBag = {
        return DisposeBag()
    }()
    
    init(_ service: T, _ db: D? = nil) {
        self.service = service
        self.db = db
    }
}
