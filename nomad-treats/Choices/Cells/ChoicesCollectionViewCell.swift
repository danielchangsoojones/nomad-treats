//
//  ChoicesCollectionViewCell.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

class ChoicesCollectionViewCell: GlidingCollectionViewCell {
    private var itemPhotoImageView: UIImageView!
    private var bottomStackView: UIStackView!
    private var itemNameLabel: UILabel!
    private var priceLabel: UILabel!
    private var addToCartButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBorder()
        setShadow(color: .jellyTeal)
        setupItemPhotoImageView()
        setupBottomStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, price: Double) {
        itemNameLabel.text = name
        priceLabel.text = price.toPrice
    }
    
    private func setupItemPhotoImageView() {
        itemPhotoImageView = UIImageView()
        itemPhotoImageView.contentMode = .scaleAspectFill
        itemPhotoImageView.clipsToBounds = true
        contentView.addSubview(itemPhotoImageView)
        itemPhotoImageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView()
        bottomStackView.alignment = .leading
        bottomStackView.axis = .vertical
        bottomStackView.distribution = .fillProportionally
        bottomStackView.spacing = 2
        contentView.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(11)
            let verticalInset = 10
            make.top.equalTo(itemPhotoImageView.snp.bottom).offset(verticalInset)
            make.bottom.equalToSuperview().inset(verticalInset)
        }
        setupItemNameLabel()
        setupPriceLabel()
        setupAddToCartLabel()
    }
    
    private func setupItemNameLabel() {
        itemNameLabel = UILabel()
        itemNameLabel.font = .systemFont(ofSize: 25, weight: .medium)
        bottomStackView.addArrangedSubview(itemNameLabel)
    }
    
    private func setupPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 22, weight: .light)
        priceLabel.textColor = .jellyTeal
        bottomStackView.addArrangedSubview(priceLabel)
    }
    
    private func setupAddToCartLabel() {
        addToCartButton = UIButton()
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.setTitleColor(.black, for: .normal)
        addToCartButton.backgroundColor = .aquamarineBlue
        addToCartButton.layer.cornerRadius = 5
        let horizontalInset: CGFloat = frame.width * 0.2
        let verticalInset: CGFloat = 5
        addToCartButton.contentEdgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        bottomStackView.addArrangedSubview(addToCartButton)
    }
}
