//
//  GenreFilterCollectionViewCell.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import UIKit

class GenreFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filterBackgroundView: UIView!
    @IBOutlet weak var genreNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            filterBackgroundView.backgroundColor = isSelected ? #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 0.6) : #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            genreNameLabel.textColor = isSelected ? #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 1) : #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1)
            filterBackgroundView.layer.borderColor = isSelected ? #colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.862745098, alpha: 1) : #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1)
        }
    }
    
}
