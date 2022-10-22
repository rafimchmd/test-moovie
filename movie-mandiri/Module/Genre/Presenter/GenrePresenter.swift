//
//  GenrePresenter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

class GenrePresenter: GenrePresenterProtocol {
    var view: GenreViewProtocol?
    
    var interactor: GenreInteractorProtocol?
    
    var router: GenreRouterProtocol?
    
    init(view: GenreViewProtocol, interactor: GenreInteractorProtocol, router: GenreRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getAllGenre() {
        interactor?.processGetAllGenre()
    }
    
    func getMovieByGenre(categoryId: String, page: String) {
        interactor?.processGetMovieByGenre(categoryId: categoryId, page: page)
    }
}

extension GenrePresenter: GenreInteractorOutputProtocol {
    func responseGetAllGenre(response: ResGenreStruct) {
        view?.displayGenre(response: response)
    }
    
    func responseGetMovie(response: ResAllMovieStruct) {
        view?.displayMovieList(response: response)
    }
}
