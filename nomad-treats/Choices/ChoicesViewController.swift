//
//  ChoicesViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

protocol ChoicesVCDelegate: class {
    func getCurrentVendingItems() -> [VendingItem]
    func addQuantity(at index: Int)
    func minusQuantity(at index: Int)
}

class ChoicesViewController: UIViewController {
    unowned let delegate: ChoicesVCDelegate
    var vendingItems: [VendingItem] {
        return delegate.getCurrentVendingItems()
    }
    var collectionView: UICollectionView!
    
    init(delegate: ChoicesVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}

extension ChoicesViewController: UICollectionViewDataSource {
    private func setupCollectionView() {
        let layout = createCollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: ChoicesCollectionViewCell.self)
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let horizontalInset: CGFloat = 25
        layout.sectionInset = UIEdgeInsets(top: 20, left: horizontalInset, bottom: 10, right: horizontalInset)
        layout.minimumLineSpacing = 32
        layout.itemSize = CGSize(width: 194, height: 242)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = vendingItems[indexPath.item]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ChoicesCollectionViewCell.self)
        let showAddToCart = item.quantitySelected == 0
        cell.configure(name: item.name, price: item.price, isAddToCartShowing: showAddToCart)
        cell.setButtonActions(increaseQuantityAction: { [weak self] in
            self?.delegate.addQuantity(at: indexPath.item)
        }, minusQuantityAction: { [weak self] in
            self?.delegate.minusQuantity(at: indexPath.item)
        })
        return cell
    }
    
    func reload() {
        let indexSet = IndexSet(integer: 0)
        collectionView.reloadSections(indexSet)
    }
}

extension ChoicesViewController: UICollectionViewDelegate {
    
}
