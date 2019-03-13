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
    
    var objectID: String {
        return "This should eventually be the database objectID"
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
        super.init()
    }
}

extension Array where Element: VendingItem {
    func matching(_ objectID: String) -> Element? {
        return first { (element) -> Bool in
            element.objectID == objectID
        }
    }
}
