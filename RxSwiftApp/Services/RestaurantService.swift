//
//  RestaurantService.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation
import RxSwift

final class RestaurantService {
    
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
