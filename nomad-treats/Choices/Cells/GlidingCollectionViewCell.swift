//
//  GlidingCollectionViewCell.swift
//  Food For All
//
//  Created by Daniel Jones on 4/15/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit
import Reusable

class GlidingCollectionViewCell: UICollectionViewCell, Reusable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        addShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setShadow(color: UIColor) {
        layer.shadowColor = color.cgColor
    }
    
    private func addShadow() {
        contentView.clipsToBounds = true
        
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 7
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
