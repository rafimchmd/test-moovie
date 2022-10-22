//
//  NetworkManager.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import RxSwift
import Alamofire

enum NetworkError: Error {
    case notfoud
    case unreachable
}

class NetworkManager {
    
    static func getApi<T: Codable>(object: T.Type, url: String, parameter: Parameters?) -> Observable<T> {
        return Observable<T>.create { (observer) -> Disposable in
            let request = Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).validate().responseJSON(completionHandler: { (response) in
                switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? NetworkError.notfoud)
                            return
                        }
                        do {
                            let response = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(response)
                            observer.onCompleted()
                        } catch let error {
                            observer.onError(error)
                        }
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}
