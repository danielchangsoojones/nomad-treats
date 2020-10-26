//
//  VendingItemParse.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import Foundation
import Parse

class VendingItemParse: BaseParseObject, PFSubclassing {
    struct Keys {
        static let owner = "owner"
    }
    
    class func parseClassName() -> String {
        return "VendingItem"
    }
    
    @NSManaged var name: String
    @NSManaged var price: Double
    @NSManaged var photo: PFFileObject
    @NSManaged var lyftPrice: Double
    @NSManaged var uberPrice: Double
    @NSManaged var nomadPrice: Double
}
