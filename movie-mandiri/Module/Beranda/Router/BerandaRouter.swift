//
//  BerandaRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class BerandaRouter: BerandaRouterProtocol, TabBarItemProtocol {
    var name: String = "Beranda"
    
    var icon: UIImage = R.image.homeTabIcon()!
    
    weak var viewController: UIViewController?
    
    func assembleModule() -> UIViewController {
        let view = R.storyboard.berandaStoryboard.berandaViewController()!
        let interactor = BerandaInteractor()
        let router = BerandaRouter()
        let presenter = BerandaPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
    func gotoDetail(movie: ResMovieStruct) {
        let view = MovieDetailRouter.assembleModule(movie: movie)
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true, completion: nil)
    }
}
