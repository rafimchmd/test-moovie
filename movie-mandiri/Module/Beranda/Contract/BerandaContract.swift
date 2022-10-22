//
//  BerandaContract.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

protocol BerandaViewProtocol {
    func displayMovies(response: ResAllMovieStruct)
}

protocol BerandaRouterProtocol {
    func gotoDetail(movie: ResMovieStruct)
}

protocol BerandaPresenterProtocol {
    var view: BerandaViewProtocol? {get set}
    var interactor: BerandaInteractorProtocol? {get set}
    var router: BerandaRouterProtocol? {get set}
    
    func getAllMovies(pages: Int)
    func gotoDetail(movie: ResMovieStruct)
}

protocol BerandaInteractorProtocol {
    var presenter: BerandaInteractorOutputProtocol? {get set}
    func processGetAllMovies(pages: Int)
}

protocol BerandaInteractorOutputProtocol {
    func resultGetAllMovie(response: ResAllMovieStruct)
}
