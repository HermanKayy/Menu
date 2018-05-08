//
//  ScrollViewController.swift
//  Menu
//
//  Created by Herman Kwan on 5/7/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        scrollView.delegate = self
        pageControl.numberOfPages = tableViewStack.arrangedSubviews.count
        
        setupScrollView()
        setupPageControlLabel()
        setupPageControl()
        setupTableViewStack()
        
        
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
//        sv.contentSize = CGSize(width: sv.contentSize.width, height: sv.frame.height)
        sv.showsHorizontalScrollIndicator = false
        sv.isPagingEnabled = true 
        return sv
    }()
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.1)).isActive = true
    }
    
    let pageControlLabel: UILabel = {
        let pcLabel = UILabel()
        pcLabel.translatesAutoresizingMaskIntoConstraints = false
        pcLabel.textAlignment = .center
        pcLabel.text = "Breakfast"
        return pcLabel
    }()
    
    func setupPageControlLabel() {
        view.addSubview(pageControlLabel)
        pageControlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControlLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        pageControlLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true 
        pageControlLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true 
    }
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor.blue
        pc.pageIndicatorTintColor = UIColor.cyan
        return pc
    }()
    
    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: pageControlLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    let tableViewStack: UIStackView = {
        
        let tableview1 = tableView1()
        let tableview2 = tableView2()
        let tableview3 = tableView3()
        
        let stackView = UIStackView(arrangedSubviews: [tableview1, tableview2, tableview3])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    func setupTableViewStack() {

        scrollView.addSubview(tableViewStack)
        tableViewStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        tableViewStack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        tableViewStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        tableViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableViewStack.widthAnchor.constraint(equalToConstant: view.frame.width * CGFloat(tableViewStack.arrangedSubviews.count)).isActive = true
    }
}

extension ScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(round(pageFraction))
        
        switch pageControl.currentPage {
        case 0: pageControlLabel.text = "Breakfast"
        case 1: pageControlLabel.text = "Lunch"
        case 2: pageControlLabel.text = "Dinner"
        default: pageControlLabel.text = ""
        }
    }
}














