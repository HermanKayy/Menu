//
//  TabBarInputViews.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class TabBarInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tabBarControl: UITabBarController = {
        let tb = UITabBarController()
        tb.tabBar.barStyle = .blackOpaque
        tb.tabBar.barTintColor = UIColor.white
        return tb
    }()
    
    let cameraController: CameraViewController = {
        let cameraController = CameraViewController()
        cameraController.title = "Camera"
        cameraController.tabBarItem.image = #imageLiteral(resourceName: "camera")
        return cameraController
    }()
    
    let menuFinderController: MenuFinderViewController = {
        let menuFinderController = MenuFinderViewController()
        menuFinderController.title = "Menu List"
        menuFinderController.tabBarItem.image = #imageLiteral(resourceName: "list")
        return menuFinderController
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(tabBarControl.view)
        tabBarControl.viewControllers = [cameraController, menuFinderController]
    }
    
}
