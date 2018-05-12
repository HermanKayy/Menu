//
//  FilterViewController.swift
//  Menu
//
//  Created by Herman Kwan on 5/11/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Filter"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }

    @objc func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
