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
    
    var objectID: String {
        return vendingItemParse.objectId ?? ""
    }
    
    var imageFile: AnyObject? {
        return vendingItemParse.photo
    }
    
    var quantitySelected: Int = 0
    
    let vendingItemParse: VendingItemParse
    
    init(vendingItemParse: VendingItemParse) {
        self.vendingItemParse = vendingItemParse
        super.init()
    }
}

extension Array where Element: VendingItem {
    private func matching(_ objectID: String) -> Element? {
        return first { (element) -> Bool in
            element.objectID == objectID
        }
    }
    
    func updateQuantity(by delta: Int, for objectID: String) {
        if let vendingItem = matching(objectID) {
            vendingItem.quantitySelected += delta
        }
    }
    
    func resetQuantity(for objectID: String) {
        if let vendingItem = matching(objectID) {
            vendingItem.quantitySelected = 0
        }
    }
    
    var totalPrice: Double {
        var totalPrice: Double = 0
        for item in self {
            let subtotal = item.price * Double(item.quantitySelected)
            totalPrice += subtotal
        }
        return totalPrice
    }
}
