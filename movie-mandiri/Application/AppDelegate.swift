//
//  AppDelegate.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.setupNavigation()
        self.setupBarNavigation()
        
        self.setupRootView()
        
        return true
    }
    
    private func setupRootView() {
        RootRouter().setupTabBar(in: window!)
    }
    
    private func setupNavigation() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 1)]
        UINavigationBar.appearance().isTranslucent = false
    }
        
    private func setupBarNavigation() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().selectedImageTintColor = #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .lightGray
    }
    
}

