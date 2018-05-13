//
//  MenuFinderInputViews.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class MenuFinderInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menuSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    let menuTableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(menuSearchBar)
        menuSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        menuSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(menuTableView)
        menuTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuTableView.topAnchor.constraint(equalTo: menuSearchBar.bottomAnchor).isActive = true
        menuTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}






