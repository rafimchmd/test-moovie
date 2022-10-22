//
//  GenreRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class GenreRouter: GenreRouterProtocol, TabBarItemProtocol {
    var name: String = "Genre"
    
    var icon: UIImage = R.image.accountTabIcon()!
    
    weak var viewController: UIViewController?
    
    func assembleModule() -> UIViewController {
        let view = R.storyboard.genreStoryboard.genreViewController()!
        let interactor = GenreInteractor()
        let router = GenreRouter()
        let presenter = GenrePresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
}
