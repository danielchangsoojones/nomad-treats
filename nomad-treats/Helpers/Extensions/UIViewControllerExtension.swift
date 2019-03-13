//
//  UIViewControllerExtension.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setup(childVC: UIViewController, container: UIView) {
        addChild(childVC)
        container.insertSubview(childVC.view, at: 0)
        childVC.didMove(toParent: self)
    }
}
