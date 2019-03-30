//
//  CartView.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class CartView: UIView {
    struct Constants {
        static let width: CGFloat = 325
    }
    
    private var bottomContainer: UIView!
    private var totalPriceLabel: UILabel!
    private var payWithLabel: UILabel!
    var venmoButton: UIButton!
    var cashButton: UIButton!
    private var paymentButtonStackView: UIStackView!
    var tableView: UITableView!
    var requestProductView: RequestProductView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBottomContainer()
        setupTotalPriceLabel()
        setupPaymentButtonStackView()
        setupPayWithLabel()
        setupRequestProductView()
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(totalPrice: Double) {
        totalPriceLabel.text = "Total: \(totalPrice.toPrice)"
    }
    
    func hidePaymentButtons() {
        payWithLabel.isHidden = true
        paymentButtonStackView.isHidden = true
    }
    
    private func createBottomContainer() {
        bottomContainer = UIView()
        bottomContainer.backgroundColor = .aquamarineBlue
        self.addSubview(bottomContainer)
        bottomContainer.snp.makeConstraints { (make) in
            make.trailing.bottom.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.45)
        }
    }
    
    private func setupTotalPriceLabel() {
        totalPriceLabel = UILabel()
        totalPriceLabel.font = .systemFont(ofSize: 44, weight: .bold)
        set(totalPrice: 0)
        totalPriceLabel.textAlignment = .center
        bottomContainer.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(22)
        }
    }
    
    private func setupPayWithLabel() {
        payWithLabel = UILabel()
        payWithLabel.text = "Pay With"
        payWithLabel.font = .systemFont(ofSize: 37, weight: .light)
        payWithLabel.textAlignment = .center
        self.addSubview(payWithLabel)
        payWithLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(paymentButtonStackView.snp.top).offset(-18)
        }
    }
    
    private func setupPaymentButtonStackView() {
        setupVenmoButton()
        setupCashButton()
        paymentButtonStackView = UIStackView(arrangedSubviews: [venmoButton, cashButton])
        paymentButtonStackView.axis = .horizontal
        paymentButtonStackView.alignment = .center
        let spacing: CGFloat = 18
        paymentButtonStackView.spacing = spacing
        paymentButtonStackView.distribution = .fillEqually
        bottomContainer.addSubview(paymentButtonStackView)
        paymentButtonStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(spacing)
            make.bottom.equalToSuperview().inset(24)
        }
    }
    
    private func setupVenmoButton() {
        venmoButton = StylizedButton(text: "Venmo", backgroundColor: .venmoBlue)
    }
    
    private func setupCashButton() {
        let green = UIColor(red: 50/255, green: 189/255, blue: 38/255, alpha: 1)
        cashButton = StylizedButton(text: "Cash", backgroundColor: green)
    }
    
    private func setupTableView() {
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(requestProductView.snp.top)
        }
    }
    
    private func setupRequestProductView() {
        requestProductView = RequestProductView()
        addSubview(requestProductView)
        requestProductView.snp.makeConstraints { (make) in
            make.bottom.equalTo(bottomContainer.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}
