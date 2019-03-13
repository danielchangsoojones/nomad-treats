//
//  CartViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    override func loadView() {
        super.loadView()
        let cartView = CartView(frame: self.view.frame)
        self.view = cartView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
