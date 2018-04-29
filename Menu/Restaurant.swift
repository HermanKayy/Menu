//
//  Restaurant
//  Menu
//
//  Created by Herman Kwan on 4/28/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import Foundation

struct JSONRestaurant: Codable {
    var restaurants: [RestaurantsDictionary]
}

struct RestaurantsDictionary: Codable {
    var restaurant: Restaurant
}

struct Restaurant: Codable {
    var name: String 
}
