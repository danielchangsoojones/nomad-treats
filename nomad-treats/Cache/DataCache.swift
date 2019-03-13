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
    static var owner: String?
    
    func updateCaches() {
        loadItems(shouldUpdateCache: true, completion: nil)
    }
    
    func loadItems(shouldUpdateCache: Bool, completion: (([VendingItem]) -> Void)?) {
        if DataCache.owner == nil {
            showOwnerAlert(shouldUpdateCache: shouldUpdateCache, completion: completion)
        } else {
            let query = VendingItemParse.query() as! PFQuery<VendingItemParse>
            query.cachePolicy = shouldUpdateCache ? .networkOnly : .cacheElseNetwork
            query.whereKey(VendingItemParse.Keys.owner, equalTo: DataCache.owner ?? "")
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
    
    private func showOwnerAlert(shouldUpdateCache: Bool, completion: (([VendingItem]) -> Void)?) {
        let alert = SCLAlertView()
        let textField = alert.addTextField("Enter the owner")
        textField.autocapitalizationType = .none
        alert.addButton("Done") {
            DataCache.owner = textField.text
            self.loadItems(shouldUpdateCache: shouldUpdateCache, completion: completion)
        }
        alert.showEdit("Owner", subTitle: "Either type in daniel or mike", closeButtonTitle: "Cancel")
    }
}
