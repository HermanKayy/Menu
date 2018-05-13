//
//  InitialScreenViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    let initialScreenInputViews = InitialScreenInputViews(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.addSubview(initialScreenInputViews)
        initialScreenInputViews.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        animateBackground()
        animateTitle()
    }
    
    @objc func startButtonTapped() {
        present(TabBarViewController(), animated: true, completion: nil)
    }
    
    func animateBackground() {
        UIView.animate(withDuration: 10, delay: 0, options: [.curveLinear, .autoreverse, .repeat], animations: {
            let x = -(self.initialScreenInputViews.backgroundImage.frame.width - self.view.frame.width)
            print(self.initialScreenInputViews.backgroundImage.frame.width)
            print(self.view.frame.width)
            self.initialScreenInputViews.backgroundImage.transform = CGAffineTransform(translationX: x, y: 0)
        }, completion: nil)
    }
    
    func animateTitle() {
        initialScreenInputViews.startTitle.transform = CGAffineTransform(scaleX: 0.1, y: 0.2).rotated(by: 3)
        
        UIView.animate(withDuration: 3, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.initialScreenInputViews.startTitle.transform = .identity
        }, completion: nil)
    }
}











