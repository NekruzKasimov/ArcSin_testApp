//
//  BaseDatabase.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RealmSwift

class BaseDatabase {
    
    var db: Realm
    
    init() {
        let config = Realm.Configuration(schemaVersion: 2,
                                         migrationBlock : { _, _ in
                                            
        })
        db = try! Realm(configuration: config)
    }
    
    func clear() {
        try! db.write {
            db.deleteAll()
        }
    }
}
