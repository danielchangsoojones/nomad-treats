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
        paymentContainer.backgroundColor = .white
        addSubview(paymentContainer)
        paymentContainer.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(cartVCContainer.snp.leading)
        }
        setupInstructionLabel()
        setupVenmoUsernameLabel()
    }
    
    private func setupInstructionLabel() {
        instructionLabel = createLabel(fontSize: 36)
        instructionLabel.numberOfLines = 4
        paymentContainer.addSubview(instructionLabel)
        instructionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(60)
            make.centerY.equalToSuperview().offset(-50)
        }
    }
    
    private func setupVenmoUsernameLabel() {
        venmoUsernameLabel = createLabel(fontSize: 50)
        venmoUsernameLabel.textColor = .jellyTeal
        paymentContainer.addSubview(venmoUsernameLabel)
        venmoUsernameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(instructionLabel.snp.bottom).offset(45)
        }
    }
    
    private func createLabel(fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
        label.textAlignment = .center
        return label
    }
}
