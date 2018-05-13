//
//  RestaurantController.swift
//  Menu
//
//  Created by Herman Kwan on 5/8/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit
import Firebase

class RestaurantController {
    
    static let shared = RestaurantController()
    var tableViews = [UITableView]()
    var categories: [Category] = []
    let table = UITableView()
    
    let ref = Database.database().reference()
    
    func loadDB(resNumber: Int) {
        
        ref.child("Restaurants").child("\(resNumber)").child("category").observeSingleEvent(of: .value) { (snapshot) in
            guard let categoryDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerCategories = [Category]()
            for categoryItem in categoryDictionary {
                guard var category = Category(withDictionary: categoryItem) else { return }
                
                guard let itemDictionaries = categoryItem["items"] as? [[String: Any]] else { return }
                for itemDictionary in itemDictionaries {
                    guard let item = Item(withDictionary: itemDictionary) else { return }
                    category.items.append(item)
                }
                
                innerCategories.append(category)
            }
            self.categories = innerCategories
            var tableViewTag = 0
            var innerTableViews = [UITableView]()
            
            for _ in 0..<self.categories.count {
                let table = UITableView()
                table.register(ScrollTableViewCell.self, forCellReuseIdentifier: "cellID")
                table.tag = tableViewTag
                innerTableViews.append(table)
                tableViewTag += 1
            }
            self.tableViews = innerTableViews
        }
    }
}
