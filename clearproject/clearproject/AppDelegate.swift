//
//  AppDelegate.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        window.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window.makeKeyAndVisible()
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        navigationBarAppearace.shadowImage = UIImage()
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 32, blue: 31)
        
        window.addSubview(statusBarBackgroundView)
        window.addConstraintWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        window.addConstraintWithFormat(format: "V:|[v0(20)]|", views: statusBarBackgroundView)
        
        return true
    }
}
