//
//  UberRideViewController.swift
//  nomad-treats
//
//  Created by Daniel Kwun on 2020/10/24.
//  Copyright © 2020 Chong500Productions. All rights reserved.
//

import UIKit

class UberRideViewController: UIViewController {
    private var nomadPrice = 0.0
    private var uberPrice = 0.0
    private var lyftPrice = 0.0
    private var nomadLabel: UITextField!
    private var uberLabel: UITextField!
    private var lyftLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blueRibbon
        hideKeyboardWhenTappedAround()
        setupView()
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self.view,
                                         action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        nomadLabel = setupTextfield(placeholder: "Enter Nomad Price")
        uberLabel = setupTextfield(placeholder: "Enter Uber Price")
        lyftLabel = setupTextfield(placeholder: "Enter Lyft Price")
        uberLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
        }
        nomadLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(uberLabel.snp.top).offset(-50)
        }
        lyftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(uberLabel.snp.bottom).offset(50)
        }
        let nextButton = UIButton()
        nextButton.setTitle("Display Prices", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.backgroundColor = UIColor.white
        nextButton.layer.cornerRadius = 40
        nextButton.titleLabel?.font = .systemFont(ofSize: 45, weight: .medium)
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(lyftLabel.snp.bottom).offset(60)
            make.height.equalTo(80)
        }
    }
    
    @objc private func nextButtonPressed() {
        if let nomadPrice = nomadLabel.text {
            self.nomadPrice = Double(nomadPrice) ?? 0.0
        }
        if let uberPrice = uberLabel.text {
            self.uberPrice = Double(uberPrice) ?? 0.0
        }
        if let lyftPrice = lyftLabel.text {
            self.lyftPrice = Double(lyftPrice) ?? 0.0
        }
        let priceComparisonVC = PriceComparisonViewController(nomadPrice: nomadPrice, uberPrice: uberPrice, lyftPrice: lyftPrice)
        navigationController?.pushViewController(priceComparisonVC, animated: true)
    }
    
    private func setupTextfield(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 2
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 40)
        textField.keyboardType = .numberPad
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
        }
        return textField
    }
}
