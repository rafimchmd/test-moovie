//
//  BerandaInteractor.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import RxSwift

class BerandaInteractor: BerandaInteractorProtocol {
    var presenter: BerandaInteractorOutputProtocol?
    var disposeBag = DisposeBag()
    
    func processGetAllMovies(pages: Int) {
        MovieService.getAllmovie(url: "\(URLStruct.BASE_MOVIE_DB_URL)\(URLStruct.MovieDBUrl.allMovie.rawValue)\(NetworkStruct.MOVIE_API_KEY)", parameter: nil).subscribe { (response) in
            self.presenter?.resultGetAllMovie(response: response)
        } onError: { (error) in
            print("error get all movie \(error.localizedDescription)")
        }.disposed(by: disposeBag)
    }
}
