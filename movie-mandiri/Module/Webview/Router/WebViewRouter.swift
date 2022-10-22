//
//  WebViewRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class WebViewRouter: WebViewRouterProtocol {
    weak var viewController: UIViewController?
    
    static func assembleModule(url: String) -> UIViewController {
        let view = R.storyboard.webviewStoryboard.webViewViewController()!
        let router = WebViewRouter()
        let presenter = WebViewPresenter(view: view, router: router, url: url)
        view.presenter = presenter
        router.viewController = view
        return view
        
    }
    
    func back() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
