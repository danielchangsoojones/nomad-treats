//
//  TopBar.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit
import SnapKit

class TopBar: UIView {
    var leftButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .aquamarineBlue
        addLeftButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLeftButton() {
        leftButton = UIButton(type: .custom)
        if let image = UIImage(named: "setting_wheel") {
            leftButton.setImage(image, for: .normal)
        }
        addSubview(leftButton)
        leftButton.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().inset(24)
        }
    }
    
    static func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.text = text
        return label
    }
}
