//
//  BerandaPresenter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

class BerandaPresenter: BerandaPresenterProtocol {
    var view: BerandaViewProtocol?
    
    var interactor: BerandaInteractorProtocol?
    
    var router: BerandaRouterProtocol?
    
    init(view: BerandaViewProtocol, interactor: BerandaInteractorProtocol, router: BerandaRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getAllMovies(pages: Int) {
        interactor?.processGetAllMovies(pages: pages)
    }
    
    func gotoDetail(movie: ResMovieStruct) {
        router?.gotoDetail(movie: movie)
    }
}

extension BerandaPresenter: BerandaInteractorOutputProtocol {
    func resultGetAllMovie(response: ResAllMovieStruct) {
        view?.displayMovies(response: response)
    }
}
