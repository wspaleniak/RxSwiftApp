//
//  Restaurant.swift
//  RxSwiftApp
//
//  Created by Wojciech Spaleniak on 18/03/2023.
//

import Foundation

enum Cuisine: String, Codable {
    case european
    case french
    case indian
    case mexican
    case english
}

struct Restaurant: Codable {
    let name: String
    let cuisine: Cuisine
}
