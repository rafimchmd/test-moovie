//
//  GenreContract.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

protocol GenreViewProtocol {
    func displayGenre(response: ResGenreStruct)
    func displayMovieList(response: ResAllMovieStruct)
}

protocol GenrePresenterProtocol {
    var view: GenreViewProtocol? {get set}
    var interactor: GenreInteractorProtocol? {get set}
    var router: GenreRouterProtocol? {get set}
    
    func getAllGenre()
    func getMovieByGenre(categoryId: String, page: String)
}

protocol GenreInteractorProtocol {
    var presenter: GenreInteractorOutputProtocol? {get set}
    
    func processGetAllGenre()
    func processGetMovieByGenre(categoryId: String, page: String)
}

protocol GenreInteractorOutputProtocol {
    func responseGetAllGenre(response: ResGenreStruct)
    func responseGetMovie(response: ResAllMovieStruct)
}

protocol GenreRouterProtocol {
    
}
