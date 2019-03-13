//
//  Line.swift
//  btown-rides-riders
//
//  Created by Daniel Jones on 2/4/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit

class Line: UIView {
    //when using snapkit, you must actually declare this height with a snapkit height
    var height: CGFloat {
        return 1
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .silverChalice
        alpha = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
