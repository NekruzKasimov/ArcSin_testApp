//
//  SearchUserAPI.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import RxSwift
import RxAlamofire

class SearchUserAPI: SWAPI {
    
    func searchUser(name: String) -> Observable<[User]> {
        return service.request(generateRequest(route: "search", name: name)).rx.responseToSWAPI().map { $0.results ?? [] }
    }
}

