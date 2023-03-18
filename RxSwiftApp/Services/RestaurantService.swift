//
//  RestaurantService.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation
import RxSwift

// MARK: - Protokół
protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

// MARK: - Service pobierający listę restauracji z pliku JSON
// Implementuje powyższy protokół
final class RestaurantService: RestaurantServiceProtocol {
    
    // Metoda ta zwraca obserwowaną tablicę obiektów Restaurant
    // Rozkodowujemy w niej JSON'a
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "Brak ścieżki", code: 100))
                return Disposables.create {}
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {}
        }
    }
}
