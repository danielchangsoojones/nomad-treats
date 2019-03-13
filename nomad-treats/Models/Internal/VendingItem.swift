//
//  VendingItem.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import Foundation

class VendingItem: NSObject {
    var name: String {
        return vendingItemParse.name
    }
    
    var price: Double {
        return vendingItemParse.price
    }
    
    var quantitySelected: Int = 0
    
    var objectID: String {
        return vendingItemParse.objectId ?? ""
    }
    
    let vendingItemParse: VendingItemParse
    
    init(vendingItemParse: VendingItemParse) {
        self.vendingItemParse = vendingItemParse
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
