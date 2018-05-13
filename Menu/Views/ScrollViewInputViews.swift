//
//  ScrollViewInputViews.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class ScrollViewInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = false
        sv.isPagingEnabled = true
        return sv
    }()
    
    let tableViewStack: UIStackView = {
        //        let stackView = UIStackView(arrangedSubviews: TableViewsController.shared.tableViews)
        let stackView = UIStackView(arrangedSubviews: [RestaurantController.shared.table])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    let pageControlLabel: UILabel = {
        let pcLabel = UILabel()
        pcLabel.translatesAutoresizingMaskIntoConstraints = false
        pcLabel.textAlignment = .center
        return pcLabel
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor.blue
        pc.pageIndicatorTintColor = UIColor.cyan
        return pc
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height * 0.1)).isActive = true
        
        scrollView.addSubview(tableViewStack)
        tableViewStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableViewStack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        tableViewStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        tableViewStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -(frame.height * 0.1)).isActive = true
        tableViewStack.widthAnchor.constraint(equalToConstant: frame.width * CGFloat(tableViewStack.arrangedSubviews.count)).isActive = true
        tableViewStack.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        tableViewStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        addSubview(pageControlLabel)
        pageControlLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControlLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        pageControlLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControlLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: pageControlLabel.bottomAnchor, constant: 5).isActive = true
    }
}








