//
//  CartTableViewCell.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/13/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit
import Reusable

class CartTableViewCell: UITableViewCell, Reusable {
    struct Constants {
        static let horizontalInset: CGFloat = 13
    }
    
    private var itemImageView: UIImageView!
    private var nameLabel: UILabel!
    private var priceLabel: UILabel!
    private var removeButton: UIButton!
    private var quantityCountView: QuantityCountView!
    private var quantityChanged: ((Int) -> Void)?
    private var removeAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
        setupNameLabel()
        setupPriceLabel()
        setupRemoveButton()
        setupQuantityCounter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, price: Double, quantity: Int, imageFile: AnyObject?) {
        itemImageView.loadFromFile(imageFile)
        nameLabel.text = name
        priceLabel.text = price.toPrice
        quantityCountView.set(count: quantity)
    }
    
    func set(quantityChangedAction: @escaping (Int) -> Void) {
        self.quantityChanged = quantityChangedAction
    }
    
    func set(removeAction: @escaping () -> Void) {
        self.removeAction = removeAction
    }
    
    private func setupImageView() {
        itemImageView = UIImageView()
        itemImageView.contentMode = .scaleAspectFit
        contentView.addSubview(itemImageView)
        itemImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(Constants.horizontalInset)
            make.height.width.equalTo(80)
            make.bottom.top.equalToSuperview().inset(5)
        }
    }
    
    private func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(itemImageView.snp.trailing).offset(8)
            make.top.equalTo(itemImageView)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 18, weight: .light)
        priceLabel.textColor = .jellyTeal
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
    }
}

extension CartTableViewCell {
    private func setupQuantityCounter() {
        quantityCountView = QuantityCountView()
        contentView.addSubview(quantityCountView)
        quantityCountView.minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        quantityCountView.plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        quantityCountView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(Constants.horizontalInset)
            make.centerY.equalTo(itemImageView)
        }
    }
    
    @objc private func minusButtonPressed() {
        quantityChanged?(-1)
    }
    
    @objc private func plusButtonPressed() {
        quantityChanged?(1)
    }
    
    private func setupRemoveButton() {
        removeButton = UnderlinedButton(title: "Remove")
        removeButton.addTarget(self, action: #selector(removeButtonPressed(_:)), for: .touchUpInside)
        contentView.addSubview(removeButton)
        removeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    @objc private func removeButtonPressed(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        removeAction?()
    }
}
