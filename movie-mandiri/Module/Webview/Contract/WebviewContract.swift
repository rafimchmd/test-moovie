//
//  WebviewContract.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

protocol WebviewProtocol {
    func loadData(url: String)
}

protocol WebviewPresenterProtocol {
    var view: WebviewProtocol? {get set}
    var router: WebViewRouterProtocol? {get set}
    func loadData()
    func back()
}

protocol WebViewRouterProtocol {
    func back()
}
