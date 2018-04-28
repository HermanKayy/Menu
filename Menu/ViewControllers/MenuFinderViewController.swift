//
//  MenuFinderViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class MenuFinderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: --- Life Cycles --- 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        setupMenuSearchBar()
        setupMenuTableView()
    }
    
    // MARK: --- Search Bar ---
    let menuSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    // --- Search Bar Constraints ---
    func setupMenuSearchBar() {
        view.addSubview(menuSearchBar)
        menuSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: --- Table View ---
    let menuTableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // --- Table View Constraints ---
    func setupMenuTableView() {
        view.addSubview(menuTableView)
        menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuTableView.topAnchor.constraint(equalTo: menuSearchBar.bottomAnchor).isActive = true
        menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: --- Table View Datasource Methods ---
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Test"
        return cell
    }
}










