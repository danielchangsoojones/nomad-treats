//
//  CartViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit
import SCLAlertView

class CartViewController: UIViewController {
    let delegate: ItemManagementDelegate
    var tableView: UITableView!
    let shouldShowPaymentButtons: Bool
    
    var selectedVendingItems: [VendingItem] {
        let vendingItems = delegate.getCurrentVendingItems()
        let selected = vendingItems.filter { (item) -> Bool in
            return item.quantitySelected > 0
        }
        return selected
    }
    
    init(delegate: ItemManagementDelegate, shouldShowPaymentButtons: Bool) {
        self.delegate = delegate
        self.shouldShowPaymentButtons = shouldShowPaymentButtons
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let cartView = CartView(frame: self.view.frame)
        self.view = cartView
        self.tableView = cartView.tableView
        cartView.cashButton.addTarget(self, action: #selector(cashButtonPressed), for: .touchUpInside)
        cartView.venmoButton.addTarget(self, action: #selector(venmoButtonPressed), for: .touchUpInside)
        
        if !shouldShowPaymentButtons {
            cartView.hidePaymentButtons()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func reload() {
        tableView.reloadData()
        setTotalPrice()
    }
    
    private func setTotalPrice() {
        if let cartView = self.view as? CartView {
            let totalPrice = selectedVendingItems.totalPrice
            cartView.set(totalPrice: totalPrice)
        }
    }
}

extension CartViewController: UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CartTableViewCell.self)
        
        //for iOS 9 devices, the cart view controller on the paymentVC
        //was getting stuck underneath the nav bar. This fixes it for now.
        //Technically, not the greatest fix to hard code this, but it works
        //for now.
        let yOffset = UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.size.height
        tableView.contentInset = UIEdgeInsets(top: yOffset, left: 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedVendingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vendingItem = selectedVendingItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartTableViewCell.self)
        cell.configure(name: vendingItem.name,
                       price: vendingItem.price,
                       quantity: vendingItem.quantitySelected,
                       imageFile: vendingItem.imageFile)
        
        cell.set(quantityChangedAction: { [weak self] delta in
            self?.delegate.changeQuantity(for: vendingItem.objectID, by: delta)
        })
        
        cell.set(removeAction: { [weak self] in
            self?.delegate.resetQuantity(for: vendingItem.objectID)
        })
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension CartViewController {
    @objc private func cashButtonPressed() {
        SCLAlertView().showSuccess("Cash", subTitle: "You can just pay cash to your current driver. They can also provide change.")
    }
    
    @objc private func venmoButtonPressed() {
        delegate.pushToPaymentVC()
    }
}
