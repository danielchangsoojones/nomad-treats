//
//  DataCache.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import Foundation
import Parse
import SCLAlertView

class DataCache {
    func updateCaches() {
        loadItems(shouldUpdateCache: true, completion: nil)
    }
    
    func loadItems(shouldUpdateCache: Bool, completion: (([VendingItem]) -> Void)?) {
        let query = VendingItemParse.query() as! PFQuery<VendingItemParse>
        query.cachePolicy = shouldUpdateCache ? .networkOnly : .cacheElseNetwork
        query.findObjectsInBackground { (vendingItemsParse, error) in
            if let vendingItemsParse = vendingItemsParse {
                let vendingItems = vendingItemsParse.map({ (vendingItemParse) -> VendingItem in
                    let vendingItem = VendingItem(vendingItemParse: vendingItemParse)
                    return vendingItem
                })
                completion?(vendingItems)
            } else if let error = error {
                SCLAlertView().showError("Error", subTitle: error.localizedDescription)
            }
        }
    }
}
