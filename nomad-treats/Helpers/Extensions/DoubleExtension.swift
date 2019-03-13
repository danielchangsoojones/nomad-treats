//
//  DoubleExtension.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 3/15/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation

extension Double {
    var toPrice: String {
        let price = String(format: "$%.02f", self)
        return price
    }
}
