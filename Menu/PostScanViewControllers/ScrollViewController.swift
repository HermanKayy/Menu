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
    
    let scrollViewInputViews = ScrollViewInputViews(frame: UIScreen.main.bounds)
    
    var categories: [Category]?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollViewInputViews)
        view.backgroundColor = UIColor.white
        
        // --- Testing Table View ---//
        RestaurantController.shared.table.delegate = self
        RestaurantController.shared.table.dataSource = self
        RestaurantController.shared.table.register(ScrollTableViewCell.self, forCellReuseIdentifier: "cellID")
        RestaurantController.shared.table.isPagingEnabled = false
        
        
        scrollViewInputViews.scrollView.delegate = self
        scrollViewInputViews.pageControl.numberOfPages = scrollViewInputViews.tableViewStack.arrangedSubviews.count
        
        // FIXME: Needs to be changed from "Test" to the first item of category
        scrollViewInputViews.pageControlLabel.text = "Test"
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 143/255.0, green: 192/255.0, blue: 169, alpha: 1.0)
        navigationItem.title = scrollViewInputViews.pageControlLabel.text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "rightBar"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "leftBar"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        for table in RestaurantController.shared.tableViews {
            table.delegate = self
            table.dataSource = self
        }
    }
    
    @objc func rightBarButtonTapped() {
        show(FilterViewController(), sender: self)
    }
    
    @objc func leftBarButtonTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.show(CheckOutViewController(), sender: self)
            
        }
    }
}
    
extension ScrollViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageWidth = view.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        scrollViewInputViews.pageControl.currentPage = Int(round(pageFraction))

        guard let categories = categories else { return }
        switch scrollViewInputViews.pageControl.currentPage {
        case 0: scrollViewInputViews.pageControlLabel.text = categories[0].name
        case 1: scrollViewInputViews.pageControlLabel.text = categories[1].name
        case 2: scrollViewInputViews.pageControlLabel.text = categories[2].name
        case 3: scrollViewInputViews.pageControlLabel.text = categories[3].name
        case 4: scrollViewInputViews.pageControlLabel.text = categories[4].name
        case 5: scrollViewInputViews.pageControlLabel.text = categories[5].name
        case 6: scrollViewInputViews.pageControlLabel.text = categories[6].name
        case 7: scrollViewInputViews.pageControlLabel.text = categories[7].name
        default: scrollViewInputViews.pageControlLabel.text = ""
        }

        navigationItem.title = scrollViewInputViews.pageControlLabel.text
    }
}

extension ScrollViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? ScrollTableViewCell else { return UITableViewCell() }
        cell.foodNameLabel.text = "TESTING"
        cell.descriptionLabel.text = "This is an avocado salad. It's good, you should definitely buy it. I really want to buy it since it's so freaking good"
        cell.priceLabel.text = "$10.50"
        cell.foodImage.image = #imageLiteral(resourceName: "breakfastItem")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let categories = categories else { return 0 }
//        switch tableView.tag {
//        case 0:
//            return categories[0].items.count
//        case 1:
//            return categories[1].items.count
//        case 2:
//            return categories[2].items.count
//        case 3:
//            return categories[3].items.count
//        case 4:
//            return categories[4].items.count
//        case 5:
//            return categories[5].items.count
//        case 6:
//            return categories[6].items.count
//        case 7:
//            return categories[7].items.count
//        default:
//            return 0
//        }
//

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? ItemsTableViewCell else { return UITableViewCell() }
//        guard let categories = categories else { return UITableViewCell() }
//        switch tableView.tag {
//        case 0:
//            let items = categories[0].items[indexPath.row]
//            cell.label.text = items.name
//            cell.foodImage.image = #imageLiteral(resourceName: "breakfastItem")
//        case 1:
//            let items = categories[1].items[indexPath.row]
//            cell.label.text = items.name
//        case 2:
//            let items = categories[2].items[indexPath.row]
//            cell.label.text = items.name
//        case 3:
//            let items = categories[3].items[indexPath.row]
//            cell.label.text = items.name
//        case 4:
//            let items = categories[4].items[indexPath.row]
//            cell.label.text = items.name
//        case 5:
//            let items = categories[5].items[indexPath.row]
//            cell.label.text = items.name
//        case 6:
//           let items = categories[6].items[indexPath.row]
//           cell.label.text = items.name
//        case 7:
//            let items = categories[7].items[indexPath.row]
//            cell.label.text = items.name
//        default:
//            cell.label.text = ""
//        }
//        return cell
//    }
//    }
















