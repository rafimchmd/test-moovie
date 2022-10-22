//
//  MovieDetailContract.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

protocol MovieDetailViewProtocol {
    func displayInfo(selectedMovie: ResMovieStruct)
    func displayReview(response: ResReviewStruct)
    func displayTrailerUrl(response: ResTrailerStruct)
}

protocol MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol? {get set}
    var interactor: MovieDetailInteractorProtocol? {get set}
    var router: MovieDetailRouterProtocol? {get set}
    
    func getTrailer(movieId: String)
    func getReview(movieId: String)
    func displayInfo()
    func gotoTrailer(url: String)
    func close()
}

protocol MovieDetailInteractorProtocol {
    var presenter: MovieDetailInteractorOutputProtocol? {get set}
    
    func processGetTrailer(movieId: String)
    func processGetReview(movieId: String)
}

protocol MovieDetailInteractorOutputProtocol {
    func responseMovieTrailer(response: ResTrailerStruct)
    func responseUserReview(response: ResReviewStruct)
}

protocol MovieDetailRouterProtocol {
    func gotoWebview(url: String)
    func close()
}
