//
//  Restaurant.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation

// MARK: - Enum dla opcji cuisine
// Musi być Codable, żeby można ją było dać jako typ zmiennej w struct Restaurant
// Dajemy również jako String, bo będziemy używać .rawValue
enum Cuisine: String, Codable {
    case european
    case french
    case indian
    case mexican
    case english
}

// MARK: - Struktura dla rozkodowania JSON'a
// Musi być Codable
struct Restaurant: Codable {
    let name: String
    let cuisine: Cuisine
}
