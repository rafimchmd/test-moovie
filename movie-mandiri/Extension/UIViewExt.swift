//
//  UIViewExt.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let color = newValue else {
                return
            }
            self.layer.borderColor = color.cgColor
        }
        
        get {
            guard let color = self.layer.borderColor else {
                return nil
            }
            
            return UIColor(cgColor: color)
        }
    }
    
}

extension UIView {
    func loadShimmer(darkPlaceholder: UIColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1), lightPlaceholder: UIColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1), shimmerColors: [CGColor] = [UIColor.clear.cgColor, #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1).cgColor, UIColor.clear.cgColor], duration: CFTimeInterval = 1, cornerRadius: CGFloat = 0) {

        self.layer.cornerRadius = cornerRadius

        let darkView = UIView()

        darkView.backgroundColor = darkPlaceholder

        darkView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        darkView.layer.cornerRadius = cornerRadius

        darkView.tag = 1616161616

        self.addSubview(darkView)

        self.bringSubviewToFront(darkView)

        

        let lightView = UIView()

        lightView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        lightView.backgroundColor =  #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)

        lightView.layer.cornerRadius = cornerRadius

        lightView.tag = 1010101010

        self.addSubview(lightView)

        self.bringSubviewToFront(lightView)

        

        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = shimmerColors

        gradientLayer.locations = [0, 0.5, 0.8]

        gradientLayer.frame = CGRect(x: lightView.frame.origin.x, y: lightView.frame.origin.y, width: lightView.frame.width * 2, height: lightView.frame.height * 2)

        let angle = 120 * CGFloat.pi / 180

        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)

        lightView.layer.mask = gradientLayer

        

        let animation = CABasicAnimation(keyPath: "transform.translation.x")

        animation.duration = duration

        animation.fromValue = -self.frame.width - 36

        animation.toValue = self.frame.width + 36

        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "shimmerEffect")

    }

    

    func hideShimmer(defaultRadius: CGFloat = 0) {

        weak var darkView = self.viewWithTag(1616161616)

        weak var lightView = self.viewWithTag(1010101010)

        darkView?.removeFromSuperview()

        lightView?.removeFromSuperview()

        darkView = nil

        lightView = nil

        self.layer.cornerRadius = defaultRadius

    }
}
