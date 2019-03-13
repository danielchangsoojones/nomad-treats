//
//  HomeView.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {
    var topBar: TopBar!
    var choicesVCContainer: UIView!
    var cartVCContainer: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTopBar()
        setupCartVCContainer()
        setupChoicesVCContainer()
        addNomadTreatLabel()
        setupCartLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTopBar() {
        let screenWidth = UIScreen.main.bounds.width
        let height: CGFloat = 80
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: height)
        topBar = TopBar(frame: frame)
        addSubview(topBar)
        topBar.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(height)
        }
    }
    
    private func addNomadTreatLabel() {
        let label = TopBar.createLabel(text: "Nomad Treats")
        topBar.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(choicesVCContainer)
        }
    }
    
    private func setupCartLabel() {
        let label = TopBar.createLabel(text: "Cart")
        topBar.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalTo(cartVCContainer)
        }
    }
    
    private func setupCartVCContainer() {
        cartVCContainer = UIView()
        cartVCContainer.layer.borderColor = UIColor.silverChalice.cgColor
        cartVCContainer.layer.borderWidth = 1
        addSubview(cartVCContainer)
        cartVCContainer.snp.makeConstraints { (make) in
            make.trailing.bottom.equalToSuperview()
            make.top.equalTo(topBar.snp.bottom)
            make.width.equalTo(CartView.Constants.width)
        }
    }
    
    private func setupChoicesVCContainer() {
        choicesVCContainer = UIView()
        addSubview(choicesVCContainer)
        choicesVCContainer.snp.makeConstraints { (make) in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(topBar.snp.bottom)
            make.trailing.equalTo(cartVCContainer.snp.leading)
        }
    }
}
