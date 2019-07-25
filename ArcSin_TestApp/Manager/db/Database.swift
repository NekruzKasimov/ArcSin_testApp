//
//  Database.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RealmSwift

class Database: BaseDatabase {
    
    lazy var userDao: UserDao = {
        return UserDao.init(db: db)
    }()
}
