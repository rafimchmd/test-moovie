//
//  UITableViewExt.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

extension UITableView {
    func setupBackground() {
        let bgView = UIView()
        bgView.backgroundColor = .white
        self.backgroundView = bgView
    }
}
