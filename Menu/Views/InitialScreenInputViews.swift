//
//  InitialScreenInputViews.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class InitialScreenInputViews: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundImage: UIImageView = {
        let bi = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height:0))
        bi.translatesAutoresizingMaskIntoConstraints = false
        bi.contentMode = .scaleAspectFill
        bi.image = #imageLiteral(resourceName: "eggWallpaper")
        return bi
    }()
    
    let startTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "WELCOME"
        label.font = label.font.withSize(40)
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = button.frame.size.width / 2
        button.setBackgroundImage(#imageLiteral(resourceName: "greaterThan"), for: .normal)
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(backgroundImage)
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(startTitle)
        startTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        startTitle.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        startTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        startTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
}















