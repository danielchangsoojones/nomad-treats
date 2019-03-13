//
//  ViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private var choicesVCContainer: UIView!
    private var choicesVC: ChoicesViewController!
    private var cartVC: CartViewController!
    private var cartVCContainer: UIView!
    
    private var vendingItems: [VendingItem] = []
    
    override func loadView() {
        super.loadView()
        let homeView = HomeView(frame: self.view.frame)
        self.view = homeView
        self.choicesVCContainer = homeView.choicesVCContainer
        self.cartVCContainer = homeView.cartVCContainer
        homeView.topBar.leftButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChoicesVC()
        setupCartVC()
        loadItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func loadItems() {
        DataCache().loadItems(shouldUpdateCache: false, completion: { vendingItems in
            self.vendingItems = vendingItems
            self.reloadAllUI()
        })
    }
    
    @objc private func settingsButtonPressed() {
        let settingVC = SettingsViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
}

extension HomeViewController: ItemManagementDelegate {
    func getCurrentVendingItems() -> [VendingItem] {
        return vendingItems
    }
    
    func changeQuantity(for objectID: String, by delta: Int) {
        if let vendingItem = vendingItems.matching(objectID) {
            vendingItem.quantitySelected += delta
            reloadAllUI()
        }
    }
    
    func resetQuantity(for objectID: String) {
        if let vendingItem = vendingItems.matching(objectID) {
            vendingItem.quantitySelected = 0
            reloadAllUI()
        }
    }
    
    private func reloadAllUI() {
        choicesVC.reload()
        cartVC.reload()
    }
    
    private func setupChoicesVC() {
        choicesVC = ChoicesViewController(delegate: self)
        setup(childVC: choicesVC, container: choicesVCContainer)
        snap(childVC: choicesVC)
    }
    
    private func snap(childVC: UIViewController) {
        childVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCartVC() {
        cartVC = CartViewController(delegate: self)
        setup(childVC: cartVC, container: cartVCContainer)
        snap(childVC: cartVC)
    }
}

