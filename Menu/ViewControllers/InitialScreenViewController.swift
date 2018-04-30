//
//  InitialScreenViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        animateBackground()
        setupStartTitle()
        setupStartButton()
        animateTitle()
    }
    
    let backgroundImage: UIImageView = {
        let bi = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height:0))
        bi.translatesAutoresizingMaskIntoConstraints = false
        bi.contentMode = .scaleAspectFill
        bi.image = #imageLiteral(resourceName: "backgroundImage")
        return bi
    }()
    
    func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func animateBackground() {
        UIView.animate(withDuration: 10, delay: 0, options: [.curveLinear, .autoreverse, .repeat], animations: {
            let x = -(self.backgroundImage.frame.width - self.view.frame.width)
            print(self.backgroundImage.frame.width)
            print(self.view.frame.width)
            self.backgroundImage.transform = CGAffineTransform(translationX: x, y: 0)
        }, completion: nil)
    }
    
    let startTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "WELCOME"
        label.font = label.font.withSize(40)
        return label
    }()
    
    func setupStartTitle() {
        view.addSubview(startTitle)
        startTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        startTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        startTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        startTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    let startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = button.frame.size.width / 2
        button.setBackgroundImage(#imageLiteral(resourceName: "greaterThan"), for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func startButtonTapped() {
        present(TabBarViewController(), animated: true, completion: nil)
    }
    
    func setupStartButton() {
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
//    func showTitle() {
//        someLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.2).rotated(by: 3)
//
//        UIView.animate(withDuration: 3, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
//            self.someLabel.transform = .identity
//        }) { (succes) in
//            self.animateBackground()
//            self.animatedTitleColor()
//        }
//    }
    
    func animateTitle() {
        startTitle.transform = CGAffineTransform(scaleX: 0.1, y: 0.2).rotated(by: 3)
        
        UIView.animate(withDuration: 3, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.startTitle.transform = .identity
        }, completion: nil)
    }
}











