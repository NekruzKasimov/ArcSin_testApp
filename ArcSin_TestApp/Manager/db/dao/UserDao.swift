//
//  UserDao.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import Realm

class UserDao: Dao<User> {
    
    func getAllUsers() -> Observable<[User]> {
        return self.fetchItemsAsObservable()
    }
    
    func getUsersContaining(text: String) -> Observable<[User]> {
        let predicate = NSPredicate(format: "name contains[cd] %@", text.lowercased())
        return Observable.just(db.objects(User.self).filter(predicate).toArray())
    }
    
    func saveUser(user: User) {
        self.saveItem(user)
    }
}
