//
//  ViewModel.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation
import RxSwift

// MARK: - ViewModel dla widoku ViewController
final class ViewModel {
    
    let title = "Restaurants"
    private let service: RestaurantServiceProtocol
    
    // Przypisujemy domyślną wartość - ważne dla późniejszych testów
    init(service: RestaurantServiceProtocol = RestaurantService()) {
        self.service = service
    }
    
    // Metoda wywołuje funkcję z RestaurantService
    // Metoda fetchRestaurants() zwraca tablicę obiektów [Restaurant]
    // Chcemy przekazać do widoku tablicę obiektów [RestaurantViewModel]
    // W tym celu używamy dwa razy metody map
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        return service.fetchRestaurants().map {
            $0.map {
                RestaurantViewModel(restaurant: $0)
            }
        }
    }
}
