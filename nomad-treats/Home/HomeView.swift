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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTopBar()
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
}
