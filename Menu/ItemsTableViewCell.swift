//
//  ItemsTableViewCell.swift
//  Menu
//
//  Created by Herman Kwan on 5/10/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        return label
    }()
    
    let buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
    
        return stack
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = button.frame.width / 2
        return button
    }()
    
    let foodImage: UIImageView = {
        let fi = UIImageView()
        fi.translatesAutoresizingMaskIntoConstraints = false
        fi.contentMode = .scaleAspectFill
        fi.clipsToBounds = true
        return fi
    }()
    
    let labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(foodImage)
        contentView.addSubview(foodNameLabel)
        contentView.addSubview(labelsStackView)
        contentView.addSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(plusButton)
        buttonsStackView.addArrangedSubview(quantityLabel)
        buttonsStackView.addArrangedSubview(minusButton)
        
        labelsStackView.addArrangedSubview(foodNameLabel)
        labelsStackView.addArrangedSubview(buttonsStackView)
        labelsStackView.addArrangedSubview(priceLabel)
        labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        labelsStackView.heightAnchor.constraint(equalTo: foodImage.heightAnchor).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -20).isActive = true
        
        foodImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 90).isActive = true

    }
}








