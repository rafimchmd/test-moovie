//
//  WebKitPresenter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

class WebViewPresenter: WebviewPresenterProtocol {
    var view: WebviewProtocol?
    var router: WebViewRouterProtocol?
    var url: String?
    
    init(view: WebviewProtocol, router: WebViewRouterProtocol, url: String) {
        self.view = view
        self.router = router
        self.url = url
    }
    
    func loadData() {
        view?.loadData(url: url ?? "")
    }
    
    func back() {
        router?.back()
    }
}
