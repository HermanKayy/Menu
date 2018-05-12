
//
//  AppDelegate.swift
//  Menu
//
//  Created by Herman Kwan on 4/23/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let scrollVC = ScrollViewController()
        window?.rootViewController = UINavigationController(rootViewController: scrollVC)
        
        return true
    }
}

