//
//  TabBarViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarControllers()
    }
    
    let tabBarControl: UITabBarController = {
        let tb = UITabBarController()
        tb.tabBar.barStyle = .blackOpaque
        tb.tabBar.barTintColor = UIColor.white
        return tb
    }()
    
    func createTabBarControllers() {
        view.addSubview(tabBarControl.view)
        
        let menuFinderController = MenuFinderViewController()
        menuFinderController.title = "Menu List"
        menuFinderController.tabBarItem.image = #imageLiteral(resourceName: "list")
        
        
        let cameraController = CameraViewController()
        cameraController.title = "Camera"
        cameraController.tabBarItem.image = #imageLiteral(resourceName: "camera")

        
        tabBarControl.viewControllers = [menuFinderController, cameraController]
    }
    
}
