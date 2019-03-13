//
//  UIColorExtension.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/17/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let jellyTeal = UIColor(red: 1/255, green: 195/255, blue: 167/255, alpha: 1)
    static let silverChalice = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
    static let aquamarineBlue = UIColor(red: 108/255, green: 223/255, blue: 214/255, alpha: 1)
    static let venmoBlue = UIColor(red: 67/255, green: 149/255, blue: 206/255, alpha: 1)
    static let lightPurple = UIColor(red: 168/255, green: 139/255, blue: 235/255, alpha: 1)
    
    static let gradientColors: [CGColor] = [UIColor.aquamarineBlue.cgColor, UIColor.lightPurple.cgColor]
    
    static func addGradient(colors: [CGColor] = gradientColors, to view: UIView, startPoint: CGPoint, endPoint: CGPoint) {
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = view.frame.size
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        view.layer.insertSublayer(gradient, at: 0)
    }
}
