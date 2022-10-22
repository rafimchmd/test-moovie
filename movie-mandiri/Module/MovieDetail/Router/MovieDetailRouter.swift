//
//  MovieDetailRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    weak var viewController: UIViewController?
    
    static func assembleModule(movie: ResMovieStruct) -> UIViewController {
        let view = R.storyboard.movieDetailStoryboard.movieDetailViewController()!
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: view, interactor: interactor, router: router, selectedMovie: movie)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    func gotoWebview(url: String) {
        let view = WebViewRouter.assembleModule(url: url)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
    func close() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
