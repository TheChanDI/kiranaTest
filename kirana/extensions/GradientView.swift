//
//  GradientView.swift
//  kirana
//
//  Created by ENFINY INNOVATIONS on 4/7/20.
//  Copyright © 2020 ENFINY INNOVATIONS. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
//        gradientLayer.locations = [1.0, 0.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    

}

