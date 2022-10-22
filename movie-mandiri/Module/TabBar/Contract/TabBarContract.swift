//
//  TabBarContract.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

protocol TabBarItemProtocol {
    var name: String {get set}
    var icon: UIImage {get set}
    
    func assembleModule() -> UIViewController
}

protocol TabBarViewProtocol {
    
}

protocol TabBarRouterProtocol {
    
}
