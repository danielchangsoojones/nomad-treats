//
//  PaymentViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    private var cartVCContainer: UIView!
    private var cartVC: CartViewController!
    private var instructionLabel: UILabel!
    private var usernameLabel: UILabel!
    
    unowned var delegate: ItemManagementDelegate
    
    init(delegate: ItemManagementDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let paymentView = PaymentView(frame: self.view.frame)
        self.view = paymentView
        self.cartVCContainer = paymentView.cartVCContainer
        self.instructionLabel = paymentView.instructionLabel
        self.usernameLabel = paymentView.venmoUsernameLabel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCartVC()
        setInstructionLabelText()
        setVenmoUsername()
    }
    
    private func setInstructionLabelText() {
        let price = delegate.getCurrentVendingItems().totalPrice.toPrice
        instructionLabel.text = "Your driver will give you your items once you venmo \(price) to this address:"
    }
    
    private func setVenmoUsername() {
        if DataCache.owner == "daniel" {
            usernameLabel.text = "@Daniel-Jones-30"
        } else {
            usernameLabel.text = "@Michael-McHugh-4"
        }
    }
}

extension PaymentViewController: ItemManagementDelegate {
    func pushToPaymentVC() {}
    
    func getCurrentVendingItems() -> [VendingItem] {
        return delegate.getCurrentVendingItems()
    }
    
    func changeQuantity(for objectID: String, by delta: Int) {
        delegate.changeQuantity(for: objectID, by: delta)
        reloadUI()
    }
    
    func resetQuantity(for objectID: String) {
        delegate.resetQuantity(for: objectID)
        reloadUI()
    }
    
    private func reloadUI() {
        cartVC.reload()
        setInstructionLabelText()
    }
    
    private func setupCartVC() {
        cartVC = CartViewController(delegate: self, shouldShowPaymentButtons: false)
        setup(childVC: cartVC, container: cartVCContainer)
        snap(childVC: cartVC)
        cartVC.reload()
    }
    
    private func snap(childVC: UIViewController) {
        childVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
