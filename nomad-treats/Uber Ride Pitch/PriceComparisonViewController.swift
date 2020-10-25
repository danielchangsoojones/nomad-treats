//
//  PriceComparisonViewController.swift
//  nomad-treats
//
//  Created by Daniel Kwun on 2020/10/25.
//  Copyright © 2020 Chong500Productions. All rights reserved.
//

import UIKit

class PriceComparisonViewController: UIViewController {
    private var nomadPrice: Double
    private var uberPrice: Double
    private var lyftPrice: Double
    
    private var innerView: UIView!
    private var titleLabel: UILabel!
    private var comparePricesLabel: UILabel!
    private var competitorLogo: UIButton!
    private var nomadLogo: UIButton!
    private var competitorAppPriceLabel: UILabel!
    private var nomadPriceLabel: UILabel!
    
    init(nomadPrice: Double, uberPrice: Double, lyftPrice: Double) {
        self.nomadPrice = nomadPrice
        self.uberPrice = uberPrice
        self.lyftPrice = lyftPrice
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blueRibbon
        setupInnerView()
        let currentApp = lyftPrice > uberPrice ? "lyft" : "uber"
        setupTitleLabel(competitorApp: currentApp)
        setupComparePricesLabel()
        setupLogos(competitorApp: currentApp)
        setupPriceLabels(competitorApp: currentApp)
        setupDownloadIcons()
    }
    
    private func setupInnerView() {
        innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 15
        view.addSubview(innerView)
        innerView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(120)
        }
    }
    
    private func setupTitleLabel(competitorApp: String) {
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 90, weight: .bold)
        titleLabel.numberOfLines = 2
        let main_string = "nomad rides is always \ncheaper than \(competitorApp)"
        let string_to_color = "nomad rides"
        let range = (main_string as NSString).range(of: string_to_color)
        let attributedString = NSMutableAttributedString(string: main_string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blueRibbon , range: range)
        titleLabel.attributedText = attributedString
        innerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(15)
        }
    }
    
    private func setupComparePricesLabel() {
        comparePricesLabel = UILabel()
        comparePricesLabel.text = "compare prices for this ride"
        comparePricesLabel.numberOfLines = 3
        comparePricesLabel.textAlignment = .center
        comparePricesLabel.font = .systemFont(ofSize: 60, weight: .semibold)
        comparePricesLabel.layer.cornerRadius = 15
        comparePricesLabel.layer.borderColor = UIColor.black.cgColor
        comparePricesLabel.layer.borderWidth = 2
        innerView.addSubview(comparePricesLabel)
        comparePricesLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(70)
            make.width.equalTo(300)
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
            make.height.equalTo(300)
        }
    }
    
    private func setupLogos(competitorApp: String) {
        competitorLogo = UIButton()
        let competitorLogoImage = competitorApp == "uber" ? "uberlogo" : "lyftlogo"
        if let image = UIImage(named: "\(competitorLogoImage)") {
            competitorLogo.setImage(image, for: .normal)
            competitorLogo.imageView?.contentMode = .scaleAspectFit
        }
        innerView.addSubview(competitorLogo)
        competitorLogo.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.leading.equalTo(comparePricesLabel.snp.trailing).offset(100)
            make.top.equalTo(comparePricesLabel)
        }
        
        nomadLogo = UIButton()
        if let image = UIImage(named: "nomadlogo") {
            nomadLogo.setImage(image, for: .normal)
            nomadLogo.imageView?.contentMode = .scaleAspectFit
        }
        innerView.addSubview(nomadLogo)
        nomadLogo.snp.makeConstraints { (make) in
            make.height.width.equalTo(competitorLogo)
            make.leading.equalTo(competitorLogo.snp.trailing).offset(100)
            make.top.equalTo(competitorLogo)
        }
    }
    
    private func setupPriceLabels(competitorApp: String) {
        competitorAppPriceLabel = UILabel()
        let competitorPrice = competitorApp == "uber" ?  uberPrice : lyftPrice
        competitorAppPriceLabel.text = "$" + String(competitorPrice)
        competitorAppPriceLabel.font = .systemFont(ofSize: 70, weight: .bold)
        innerView.addSubview(competitorAppPriceLabel)
        competitorAppPriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(competitorLogo)
            make.bottom.equalTo(comparePricesLabel)
        }
        
        nomadPriceLabel = UILabel()
        nomadPriceLabel.text = "$" + String(nomadPrice)
        nomadPriceLabel.font = .systemFont(ofSize: 70, weight: .bold)
        innerView.addSubview(nomadPriceLabel)
        nomadPriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(nomadLogo)
            make.bottom.equalTo(comparePricesLabel)
        }
    }
    
    private func setupDownloadIcons() {
        let iOSDownloadIcon = UIButton()
        if let image = UIImage(named: "ios_download") {
            iOSDownloadIcon.setImage(image, for: .normal)
            iOSDownloadIcon.imageView?.contentMode = .scaleAspectFit
        }
        innerView.addSubview(iOSDownloadIcon)
        iOSDownloadIcon.snp.makeConstraints { (make) in
            make.trailing.equalTo(titleLabel.snp.centerX).inset(30)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(65)
        }
        
        let androidDownloadIcon = UIButton()
        if let image = UIImage(named: "android_download") {
            androidDownloadIcon.setImage(image, for: .normal)
            androidDownloadIcon.imageView?.contentMode = .scaleAspectFit
        }
        innerView.addSubview(androidDownloadIcon)
        androidDownloadIcon.snp.makeConstraints { (make) in
            make.leading.equalTo(iOSDownloadIcon.snp.trailing)
            make.bottom.equalTo(iOSDownloadIcon)
            make.height.equalTo(iOSDownloadIcon)
        }
    }
}
