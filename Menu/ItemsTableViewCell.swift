//
//  ItemsTableViewCell.swift
//  Menu
//
//  Created by Herman Kwan on 5/10/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .right
        return label
    }()
    
    let foodImage: UIImageView = {
        let fi = UIImageView()
        fi.translatesAutoresizingMaskIntoConstraints = false
        return fi
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(foodImage)
        foodImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        self.addSubview(label)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        label.widthAnchor.constraint(equalToConstant: self.frame.width / 2).isActive = true
        label.heightAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true 
    }
}
