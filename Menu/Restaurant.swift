//
//  Restaurant.swift
//  Menu
//
//  Created by Herman Kwan on 5/8/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

struct Category {
    let name: String
    var items: [Item]

    init?(withDictionary dictionary: [String: Any], items: [Item] = []) {
        self.name = dictionary["name"] as? String ?? ""
        self.items = items
    }
}

struct Item {
    let name: String
    
    init?(withDictionary dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? "" 
    }
}



