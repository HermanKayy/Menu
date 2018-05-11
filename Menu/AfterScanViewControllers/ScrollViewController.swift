//
//  ScrollViewController.swift
//  Menu
//
//  Created by Herman Kwan on 5/7/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit
import Firebase

class ScrollViewController: UIViewController {
    
    var categories: [Category]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        scrollView.delegate = self
        pageControl.numberOfPages = tableViewStack.arrangedSubviews.count
        
        if let categories = categories {
            pageControlLabel.text = categories[0].name
        }

        setupScrollView()
        setupPageControlLabel()
        setupPageControl()
        setupTableViewStack()
        
        navigationItem.title = pageControlLabel.text
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cart", style: .plain, target: self, action: nil)
       
        for table in TableViewsController.shared.tableViews {
            table.delegate = self
            table.dataSource = self
        }
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
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
        let stackView = UIStackView(arrangedSubviews: TableViewsController.shared.tableViews)
        print(TableViewsController.shared.tableViews.count)
        print(TableViewsController.shared.categories.count)
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
        tableViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.1)).isActive = true
        tableViewStack.widthAnchor.constraint(equalToConstant: view.frame.width * CGFloat(tableViewStack.arrangedSubviews.count)).isActive = true
    }
}

extension ScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageWidth = view.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(round(pageFraction))
        
        guard let categories = categories else { return }
        switch pageControl.currentPage {
        case 0: pageControlLabel.text = categories[0].name
        case 1: pageControlLabel.text = categories[1].name
        case 2: pageControlLabel.text = categories[2].name
        case 3: pageControlLabel.text = categories[3].name
        case 4: pageControlLabel.text = categories[4].name
        case 5: pageControlLabel.text = categories[5].name
        case 6: pageControlLabel.text = categories[6].name
        case 7: pageControlLabel.text = categories[7].name
        default: pageControlLabel.text = ""
        }
        
        navigationItem.title = pageControlLabel.text
    }
}

extension ScrollViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let categories = categories else { return 0 }
        switch tableView.tag {
        case 0:
            return categories[0].items.count
        case 1:
            return categories[1].items.count
        case 2:
            return categories[2].items.count
        case 3:
            return categories[3].items.count
        case 4:
            return categories[4].items.count
        case 5:
            return categories[5].items.count
        case 6:
            return categories[6].items.count
        case 7:
            return categories[7].items.count
        default:
            return 0
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? ItemsTableViewCell else { return UITableViewCell() }
        guard let categories = categories else { return UITableViewCell() }
        switch tableView.tag {
        case 0:
            let items = categories[0].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 1:
            let items = categories[1].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 2:
            let items = categories[2].items[indexPath.row]
            cell.label.text = items.name
        case 3:
            let items = categories[3].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 4:
            let items = categories[4].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 5:
            let items = categories[5].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 6:
           let items = categories[6].items[indexPath.row]
            cell.textLabel?.text = items.name
        case 7:
            let items = categories[7].items[indexPath.row]
            cell.textLabel?.text = items.name
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 
    }

}

















