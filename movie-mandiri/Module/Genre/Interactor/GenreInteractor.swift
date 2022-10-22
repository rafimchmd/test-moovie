//
//  GenreInteractor.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import RxSwift

class GenreInteractor: GenreInteractorProtocol {
    var presenter: GenreInteractorOutputProtocol?
    var disposeBag = DisposeBag()
    
    func processGetAllGenre() {
        MovieService.getGenre(url: "\(URLStruct.BASE_MOVIE_DB_URL)\(URLStruct.MovieDBUrl.getGenre.rawValue)\(NetworkStruct.MOVIE_API_KEY)", parameter: nil).subscribe { (response) in
            self.presenter?.responseGetAllGenre(response: response)
        } onError: { (error) in
            print("error get genres \(error.localizedDescription)")
        }

    }
    
    func processGetMovieByGenre(categoryId: String, page: String) {
        MovieService.getAllmovie(url: "\(URLStruct.BASE_MOVIE_DB_URL)\(URLStruct.MovieDBUrl.allMovie.rawValue)\(NetworkStruct.MOVIE_API_KEY)&with_genres=\(categoryId)&page=\(page)", parameter: nil).subscribe { (response) in
            self.presenter?.responseGetMovie(response: response)
        } onError: { (error) in
            print("error get movie genre \(error.localizedDescription)")
        }
    }
}
