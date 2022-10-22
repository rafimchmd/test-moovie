//
//  WebViewViewController.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var presenter: WebviewPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        presenter?.loadData()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Trailer"
        let leftItem = UIBarButtonItem(image: R.image.back(), style: .plain, target: self, action: #selector(back))
        leftItem.tintColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func back() {
        presenter?.back()
    }
    
}

extension WebViewViewController: WebviewProtocol {
    func loadData(url: String) {
        print(url)
        webView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=\(url)")!))
    }
}
