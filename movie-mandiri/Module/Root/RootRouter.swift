//
//  RootRouter.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

class RootRouter: RootRouterProtocol {
    
    var tabbarModuleRouter: TabBarRouterProtocol?
    
    func setupTabBar(in window: UIWindow) {
        window.makeKeyAndVisible()
        let routers = self.setupScreen(in: window)
        tabbarModuleRouter = TabBarRouter.installWindow(rootRouter: self, window: window, child: routers)
    }
    
    func setupScreen(in window: UIWindow) -> [TabBarItemProtocol] {
        var routers = [TabBarItemProtocol]()
        
        // Beranda page
        let beranda = BerandaRouter()
        routers.append(beranda)
        
        // Genre page
        let genre = GenreRouter()
        routers.append(genre)
        
        return routers
    }
    
}
