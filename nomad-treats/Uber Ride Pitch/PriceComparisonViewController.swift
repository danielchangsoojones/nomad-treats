//
//  PriceComparisonViewController.swift
//  nomad-treats
//
//  Created by Daniel Kwun on 2020/10/25.
//  Copyright © 2020 Chong500Productions. All rights reserved.
//

import UIKit

class PriceComparisonViewController: UIViewController {
    private var nomadPrice: Double
    private var uberPrice: Double
    private var lyftPrice: Double
    
    init(nomadPrice: Double, uberPrice: Double, lyftPrice: Double) {
        self.nomadPrice = nomadPrice
        self.uberPrice = uberPrice
        self.lyftPrice = lyftPrice
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blueRibbon
    }
    
    //show price (uber/lyft) that is larger (meaning that the rider is on u or l)
    
}
