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
    
    override func loadView() {
        super.loadView()
        let homeView = HomeView(frame: self.view.frame)
        self.view = homeView
        self.choicesVCContainer = homeView.choicesVCContainer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChoicesVC()
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
}

extension HomeViewController {
    private func setupChoicesVC() {
        let choicesVC = ChoicesViewController()
        setup(childVC: choicesVC, container: choicesVCContainer)
        snap(childVC: choicesVC)
    }
    
    private func snap(childVC: UIViewController) {
        childVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

