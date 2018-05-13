//
//  ScrollTableViewCell.swift
//  Menu
//
//  Created by Herman Kwan on 5/10/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class ScrollTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let foodImage: UIImageView = {
        let fi = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        fi.translatesAutoresizingMaskIntoConstraints = false
        fi.contentMode = .scaleAspectFill
        fi.clipsToBounds = true
        return fi
    }()
    
//    let labelsStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        return stack
//    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
//    let plusButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("+", for: .normal)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.layer.cornerRadius = 12.5
//        button.backgroundColor = UIColor.green
//        return button
//    }()
    
//    let quantityLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let minusButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("-", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        return button
//    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.font = label.font.withSize(13)
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        return label
    }()
    
//    let buttonsStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.alignment = UIStackViewAlignment.fill
//        return stack
//    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(foodImage)
        foodImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (contentView.frame.height / 2) - (foodImage.frame.height / 2)).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        contentView.addSubview(foodNameLabel)
        foodNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        foodNameLabel.topAnchor.constraint(equalTo: foodImage.topAnchor).isActive = true
        foodNameLabel.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -12).isActive = true
        
//        contentView.addSubview(plusButton)
//        plusButton.leadingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor).isActive = true
//        plusButton.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 5).isActive = true
//        plusButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        plusButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
//
//        contentView.addSubview(quantityLabel)
//        quantityLabel.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 5).isActive = true
//        quantityLabel.topAnchor.constraint(equalTo: plusButton.topAnchor).isActive = true
//        quantityLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
//
//        contentView.addSubview(minusButton)
//        minusButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 5).isActive = true
//        minusButton.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 5).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -12).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.leadingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: foodNameLabel.trailingAnchor, constant: -12).isActive = true
        
//        contentView.addSubview(buttonsStackView)
//        buttonsStackView.addArrangedSubview(plusButton)
//        buttonsStackView.addArrangedSubview(quantityLabel)
//        buttonsStackView.addArrangedSubview(minusButton)
//
//        contentView.addSubview(labelsStackView)
//        labelsStackView.addArrangedSubview(foodNameLabel)
//        labelsStackView.addArrangedSubview(buttonsStackView)
//        labelsStackView.addArrangedSubview(priceLabel)
//        labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
//        labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        labelsStackView.heightAnchor.constraint(equalTo: foodImage.heightAnchor).isActive = true
//        labelsStackView.trailingAnchor.constraint(equalTo: foodImage.leadingAnchor, constant: -20).isActive = true
    }
}








