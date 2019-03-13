//
//  PaymentView.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class PaymentView: UIView {
    private var paymentContainer: UIView!
    var cartVCContainer: UIView!
    var instructionLabel: UILabel!
    var venmoUsernameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCartVCContainer()
        setupPaymentContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCartVCContainer() {
        cartVCContainer = UIView()
        cartVCContainer.layer.borderColor = UIColor.silverChalice.cgColor
        cartVCContainer.layer.borderWidth = 1
        addSubview(cartVCContainer)
        cartVCContainer.snp.makeConstraints { (make) in
            make.trailing.bottom.top.equalToSuperview()
            make.width.equalTo(CartView.Constants.width)
        }
    }
    
    private func setupPaymentContainer() {
        paymentContainer = UIView()
        addSubview(paymentContainer)
        paymentContainer.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(cartVCContainer.snp.leading)
        }
        setupInstructionLabel()
        setupVenmoUsernameLabel()
    }
    
    private func setupInstructionLabel() {
        instructionLabel = createLabel()
        instructionLabel.numberOfLines = 4
        paymentContainer.addSubview(instructionLabel)
        instructionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(37)
        }
    }
    
    private func setupVenmoUsernameLabel() {
        venmoUsernameLabel = createLabel()
        venmoUsernameLabel.textColor = .jellyTeal
        paymentContainer.addSubview(venmoUsernameLabel)
        venmoUsernameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(instructionLabel.snp.bottom).offset(45)
        }
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        return label
    }
}
