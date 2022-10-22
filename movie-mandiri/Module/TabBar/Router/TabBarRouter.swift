//
//  TabBarRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class TabBarRouter: TabBarRouterProtocol {
    weak var rootRouter: RootRouter?
    
    static func installWindow(rootRouter: RootRouter, window: UIWindow, child: [TabBarItemProtocol]) -> TabBarRouterProtocol {
        return TabBarRouter().setupScreen(rootRouter: rootRouter, window: window, child: child, selectedIndex: nil)
    }
    
    private func setupScreen(rootRouter: RootRouter, window: UIWindow, child: [TabBarItemProtocol], selectedIndex: Int?) -> TabBarRouterProtocol {
        let view = R.storyboard.tabBarStorybord.tabBarViewController()!
        let router = TabBarRouter()
        router.rootRouter = rootRouter
        
        var viewControllers: [UIViewController] = [UIViewController]()
        let tabBarController = view as UITabBarController
        
        for childModule in child {
            let tabbaritem = UITabBarItem()
            tabbaritem.image = childModule.icon.withRenderingMode(.automatic)
            tabbaritem.title = childModule.name
            let viewController = childModule.assembleModule()
            let navigationViewController = UINavigationController(rootViewController: viewController)
            navigationViewController.tabBarItem = tabbaritem
            navigationViewController.setNavigationBarHidden(false, animated: false)
            navigationViewController.title = childModule.name
            viewControllers.append(navigationViewController)
        }
        
        tabBarController.viewControllers = viewControllers
        
        if let index = selectedIndex {
            tabBarController.selectedIndex = index
        }
        
        window.rootViewController = tabBarController
        return router
    }
}
