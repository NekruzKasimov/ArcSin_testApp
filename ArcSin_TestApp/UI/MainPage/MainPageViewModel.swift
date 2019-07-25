//
//  MainPageViewModel.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Foundation
import RxSwift

class MainPageViewModel: BaseVM<MainPageRepository> {
    var events = PublishSubject<Event>()

    func searchUser(name: String) {
        if repository.isConnectedToNetwork() {
            repository.searchUser(name: name).subscribe(onNext: { users in
                self.events.onNext(Event.USER(users))
            }, onError: { error in
                if let commonError = error as? CommonError {
                    self.events.onNext(Event.ERROR(commonError))
                }
            }).disposed(by: disposable)
        } else {
            repository.getUsersFromDB().subscribe(onNext: { users in
                self.events.onNext(Event.USER(users))
            }).disposed(by: disposable)
        }
    }
    
    func saveUser(_ user: User) {
        repository.saveUserToDB(user: user)
    }
    
    enum Event {
        case USER([User])
        case ERROR(CommonError)
    }
}
