//
//  MainPageRepository.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RxSwift

class MainPageRepository: BaseRepository<SearchUserAPI, Database> {

    func searchUser(name: String) -> Observable<[User]> {
        return service.searchUser(name: name)
    }
    
    func getUsersFromDB() -> Observable<[User]> {
        return db!.userDao.getAllUsers()
    }
    
    func saveUserToDB(user: User) {
        db!.userDao.saveUser(user: user)
    }
}
