//
//  MovieDetailInteractor.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var presenter: MovieDetailInteractorOutputProtocol?
    
    func processGetReview(movieId: String) {
//        "https://api.themoviedb.org/3/movie/436270/reviews?api_key=37243569b0b802dfad468517767ab959"
        MovieService.getReview(url: "\(URLStruct.BASE_MOVIE_DB_URL)\(URLStruct.MovieDBUrl.getTrailer.rawValue)/\(movieId)/reviews?api_key=\(NetworkStruct.MOVIE_API_KEY)", parameter: nil).subscribe { (response) in
            self.presenter?.responseUserReview(response: response)
        } onError: { (error) in
            print("error get movie review \(error.localizedDescription)")
        }
    }
    
    func processGetTrailer(movieId: String) {
        MovieService.getTrailer(url: "\(URLStruct.BASE_MOVIE_DB_URL)\(URLStruct.MovieDBUrl.getTrailer.rawValue)/\(movieId)/videos?api_key=\(NetworkStruct.MOVIE_API_KEY)", parameter: nil).subscribe { (response) in
            self.presenter?.responseMovieTrailer(response: response)
        } onError: { (error) in
            print("error get movie trailer \(error.localizedDescription)")
        }
    }
}
