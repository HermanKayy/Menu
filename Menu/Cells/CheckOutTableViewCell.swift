//
//  CheckOutTableViewCell.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class CheckOutTableViewCell: UITableViewCell {
    
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
        
        contentView.addSubview(quantityLabel)
        quantityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        quantityLabel.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
        contentView.addSubview(itemLabel)
        itemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        itemLabel.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 15).isActive = true
        itemLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true 
    }
}












