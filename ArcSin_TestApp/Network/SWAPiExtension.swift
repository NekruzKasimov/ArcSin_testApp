//
//  SWAPiExtension.swift
//  ArcSin_TestApp
//
//  Created by Niko on 7/20/19.
//  Copyright © 2019 Niko. All rights reserved.
//

import Alamofire
import RxSwift

extension Reactive where Base: DataRequest {
    func responseToSWAPI<T: Decodable>() -> Observable<SWAPIResponse<T>> {
        return Observable.create { observer in
            let request = self.base.validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let json = value as? [String: Any] else {
                        observer.onError(CommonError(CommonError.notFoundExeption))
                        return
                    };
                    print(json)
                    do {
                        let decoder = JSONDecoder()
                        let data = try JSONSerialization.data(withJSONObject: json)
                        let response = try decoder.decode(SWAPIResponse<T>.self, from: data)
                        if (response.results?.isEmpty)! {
                            observer.onError(CommonError(CommonError.notFoundExeption))
                            observer.onCompleted()
                            return
                        }
                        observer.onNext(response)
                        observer.onCompleted()
                    } catch {
                        //                        print(error)
                        observer.onError(CommonError(CommonError.notFoundExeption))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    observer.onError(CommonError(CommonError.connectionFailed))
                }
            }
            return Disposables.create(with: request.cancel)
            }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(ConcurrentDispatchQueueScheduler(queue: .main))
    }
    
    func responseToWallet() {
    }
}
