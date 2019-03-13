//
//  VendingItem.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import Foundation

class VendingItem: NSObject {
    var name: String
    var price: Double
    var quantitySelected: Int = 0
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
        super.init()
    }
}
