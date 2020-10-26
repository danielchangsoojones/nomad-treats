//
//  LoadingViewController.swift
//  nomad-treats
//
//  Created by Daniel Jones on 10/26/20.
//  Copyright © 2020 Chong500Productions. All rights reserved.
//

import UIKit
import Parse

class LoadingViewController: UIViewController {
    private var titleLabel: UILabel!
    private var gameTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTitleLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetRide()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadPriceComparison), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 90, weight: .bold)
        titleLabel.numberOfLines = 0
        let main_string = "nomad rides is always \ncheaper than Uber & Lyft"
        let string_to_color = "nomad rides"
        let range = (main_string as NSString).range(of: string_to_color)
        let attributedString = NSMutableAttributedString(string: main_string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blueRibbon , range: range)
        titleLabel.attributedText = attributedString
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
        }
    }
    
    private func resetRide() {
        let vendingItem = VendingItemParse()
        vendingItem.objectId = "opxGgDVqM8"
        vendingItem.nomadPrice = 0
        vendingItem.lyftPrice = 0
        vendingItem.uberPrice = 0
        vendingItem.saveInBackground()
    }
    
    @objc private func loadPriceComparison() {
        let query = VendingItemParse.query() as! PFQuery<VendingItemParse>
        query.whereKey("objectId", equalTo: "opxGgDVqM8")
        query.getFirstObjectInBackground { (itemParse, error) in
            if let itemParse = itemParse, itemParse.nomadPrice > 0  {
                let nextVC = PriceComparisonViewController(nomadPrice: itemParse.nomadPrice,
                                                           uberPrice: itemParse.uberPrice,
                                                           lyftPrice: itemParse.lyftPrice)
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else if let error = error {
                print(error)
            }
        }
    }
}
