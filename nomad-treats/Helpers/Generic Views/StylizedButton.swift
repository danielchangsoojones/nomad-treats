//
//  StylizedButton.swift
//  btown-rides-drivers
//
//  Created by Daniel Jones on 2/9/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit

class StylizedButton: UIButton {
    init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(text, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font =  .systemFont(ofSize: 26, weight: .black)
        let horizontalInset: CGFloat = 20
        let verticalInset: CGFloat = 10
        contentEdgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
