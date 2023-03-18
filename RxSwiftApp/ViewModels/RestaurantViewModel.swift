//
//  RestaurantViewModel.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation

// MARK: - ViewModel którym tworzymy obiekty potrzebne dla widoku
// Dzięki temu mamy łatwy dostęp do displayText - generuje gotowy tekst dla cellki
struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    var displayText: String {
        return "\(restaurant.name) - \(restaurant.cuisine.rawValue.capitalized)"
    }
}
