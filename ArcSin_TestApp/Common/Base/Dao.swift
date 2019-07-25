//
//  Dao.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/23/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm

class Dao<T: Object> {
    var db: Realm
    
    init(db: Realm) {
        self.db = db
    }
    
    func saveItem(_ item: T) {
        try? db.write {
            db.create(T.self, value: item, update: true)
        }
    }
    
    func saveItems(_ items: [T]) {
        try? db.write {
            items.forEach({ (item) in
                db.create(T.self, value: item, update: true)
            })
        }
    }
    
    func fetchItem() -> T? {
        return db.objects(T.self).last
    }
    
    func fetchItemsAsObservable() -> Observable<[T]> {
        return Observable.collection(from: db.objects(T.self)).map { $0.toArray() }
    }
    
    func fetchItems() -> [T] {
        let array = db.objects(T.self).toArray()
        return array
    }
}
