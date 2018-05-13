//
//  CheckOutViewController.swift
//  Menu
//
//  Created by Herman Kwan on 5/11/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    let checkOutInputViews = CheckOutInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(checkOutInputViews)
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Total"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        checkOutInputViews.tableView.delegate = self
        checkOutInputViews.tableView.dataSource = self
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension CheckOutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TEST", for: indexPath) as? CheckOutTableViewCell else { return UITableViewCell() }
        cell.itemLabel.text = "Testing"
        cell.quantityLabel.text = "1"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}












