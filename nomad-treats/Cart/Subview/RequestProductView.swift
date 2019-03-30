//
//  RequestProduct.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/29/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class RequestProductView: UIView {
    private let label = UILabel()
    var letUsKnowButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addBorder()
        setupLabel()
        setupLetUsKnowButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupLabel() {
        label.text = "Have an idea for a product to sell?"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupLetUsKnowButton() {
        letUsKnowButton = StylizedButton(text: "Let Us Know", backgroundColor: .orange)
        addSubview(letUsKnowButton)
        letUsKnowButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
