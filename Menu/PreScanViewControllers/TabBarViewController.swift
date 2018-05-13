//
//  TabBarViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    let tabBarInputViews = TabBarInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabBarInputViews)
    }
}
