//
//  MovieDetailPresenter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol?
    var router: MovieDetailRouterProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var selectedMovie: ResMovieStruct?
    
    init(view: MovieDetailViewProtocol, interactor: MovieDetailInteractorProtocol, router: MovieDetailRouterProtocol, selectedMovie: ResMovieStruct) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.selectedMovie = selectedMovie
    }
    
    func getReview(movieId: String) {
        interactor?.processGetReview(movieId: movieId)
    }
    
    func getTrailer(movieId: String) {
        interactor?.processGetTrailer(movieId: movieId)
    }
    
    func displayInfo() {
        guard let movie = self.selectedMovie else {
            return
        }
        view?.displayInfo(selectedMovie: movie)
    }
    
    func gotoTrailer(url: String) {
        router?.gotoWebview(url: url)
    }
    
    func close() {
        router?.close()
    }
}


extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func responseUserReview(response: ResReviewStruct) {
        view?.displayReview(response: response)
    }
    
    func responseMovieTrailer(response: ResTrailerStruct) {
        view?.displayTrailerUrl(response: response)
    }
    
}
