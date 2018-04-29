//
//  RestaurantController.swift
//  Menu
//
//  Created by Herman Kwan on 4/28/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import Foundation

class RestaurantController {
    static let shared = RestaurantController()
    var restaurants = [Restaurant]()
    let baseURL = "https://developers.zomato.com/api/v2.1"
    
    func fetchRestuarantNamesWith(searchTerm: String, completion: @escaping([Restaurant]?) -> Void) {
        let url = URL(fileURLWithPath: baseURL).appendingPathComponent("search")
        let queries = [
            "apikey": "98e55d5ec1440a4b0a66a7b868a889a2",
            "q": searchTerm.lowercased()
        ]
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = queries.compactMap({ URLQueryItem.init(name: $0.key, value: $0.value) })
        components?.queryItems = queryItems
        
        guard let requestURL = components?.url else { completion(nil); return }
        print("This is the API URL: \(requestURL)")
        let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("Error with URL Sesson", error)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let jsonRestuarant = try jsonDecoder.decode(JSONRestaurant.self, from: data)
                    let restaurant = jsonRestuarant.restaurants.compactMap({ $0.restaurant })
                    self.restaurants = restaurant
                    completion(restaurant)
                    return
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }
        
        dataTask.resume()
    }
}









