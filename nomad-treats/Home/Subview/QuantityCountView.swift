//
//  QuantityCount.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class QuantityCountView: UIStackView {
    var minusButton: UIButton!
    var plusButton: UIButton!
    private let countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        spacing = 6
        axis = .horizontal
        alignment = .center
        setupMinusButton()
        setupCountLabel()
        setupPlusButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(count: Int) {
        countLabel.text = String(count)
    }
    
    private func setupMinusButton() {
        minusButton = UIButton()
        if let minusImage = UIImage(named: "minus") {
            minusButton.setImage(minusImage, for: .normal)
        }
        addArrangedSubview(minusButton)
    }
    
    private func setupCountLabel() {
        countLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        //TODO: eventually can remove this
        countLabel.text = String(1)
        countLabel.textAlignment = .center
        addArrangedSubview(countLabel)
    }
    
    private func setupPlusButton() {
        plusButton = UIButton()
        if let plusImage = UIImage(named: "plus") {
            plusButton.setImage(plusImage, for: .normal)
        }
        addArrangedSubview(plusButton)
    }
}
