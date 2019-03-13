//
//  CartViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    let delegate: ItemManagementDelegate
    var tableView: UITableView!
    
    var selectedVendingItems: [VendingItem] {
        let vendingItems = delegate.getCurrentVendingItems()
        let selected = vendingItems.filter { (item) -> Bool in
            return item.quantitySelected > 0
        }
        return selected
    }
    
    init(delegate: ItemManagementDelegate) {
        self.delegate = delegate
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
            var totalPrice: Double = 0
            for item in selectedVendingItems {
                totalPrice += item.price
            }
            cartView.set(totalPrice: totalPrice)
        }
    }
}

extension CartViewController: UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CartTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedVendingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vendingItem = selectedVendingItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartTableViewCell.self)
        cell.configure(name: vendingItem.name, price: vendingItem.price, quantity: vendingItem.quantitySelected)
        
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
