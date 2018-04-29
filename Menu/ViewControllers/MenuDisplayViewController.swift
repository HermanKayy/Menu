//
//  MenuDisplayViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/28/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class MenuDisplayViewController: UIViewController {
    
    var restuarant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubview(toFront: menuWebView)
        setupWebView()
    }
    
    let menuWebView: UIWebView = {
         let wv = UIWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.isOpaque = false
        return wv
    }()
    
    func setupWebView() {
        view.addSubview(menuWebView)
        menuWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
