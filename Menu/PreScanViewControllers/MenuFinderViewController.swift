//
//  MenuFinderViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class MenuFinderViewController: UIViewController {
    
    let menuFinderInputViews = MenuFinderInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(menuFinderInputViews)
        
        menuFinderInputViews.menuSearchBar.delegate = self
        menuFinderInputViews.menuTableView.delegate = self
        menuFinderInputViews.menuTableView.dataSource = self
    }
}

extension MenuFinderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        //        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MenuFinderViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
    }
}










