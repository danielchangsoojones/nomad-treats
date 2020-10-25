//
//  AppDelegate.swift
//  nomad-treats
//
//  Created by Daniel Jones on 3/12/19.
//  Copyright © 2019 Chong500Productions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Server().configure(from: launchOptions)
        setStartingVC()
        return true
    }
}

extension AppDelegate {
    private func setStartingVC() {
        toHomeVC()
    }
    
    private func toHomeVC() {
        let homeVC = UberRideViewController()
        let navController = UINavigationController(rootViewController: homeVC)
        setInitial(vc: navController)
    }
    
    private func setInitial(vc: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

