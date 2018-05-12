//
//  CheckOutViewController.swift
//  Menu
//
//  Created by Herman Kwan on 5/11/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Total"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TESTCELL.self, forCellReuseIdentifier: "TEST")
        return tv
    }()
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65).isActive = true
    }

}

class TESTCELL: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.green
        label.textAlignment = .center 
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.layer.borderWidth = 0.3
        return label
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "$ 10.05"
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(quantityLabel)
        self.addSubview(itemLabel)
        self.addSubview(priceLabel)
        
        quantityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        quantityLabel.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
        itemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemLabel.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 15).isActive = true
        itemLabel.heightAnchor.constraint(equalTo: quantityLabel.heightAnchor).isActive = true
        itemLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 5).isActive = true
    }
}

extension CheckOutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TEST", for: indexPath) as? TESTCELL else { return UITableViewCell() }
        cell.itemLabel.text = "Testing"
        cell.quantityLabel.text = "1"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}












