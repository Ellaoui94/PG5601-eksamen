//
//  FruitSection.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 14/11/2022.
//

import Foundation

enum FruitSection{
    case family([String : [Array<Fruit>.Element]])
    case genus([String : [Array<Fruit>.Element]])
    case order([String : [Array<Fruit>.Element]])
    
    var fruits: [String : [Array<Fruit>.Element]] {
        switch self {
        case .family(let fruits),
                .genus(let fruits),
                .order(let fruits):
            return fruits
        }
    }
    
    var count: Int {
        return fruits.count
    }
    
    var title: String {
        switch self {
        case .family:
            return "Family"
        case .genus:
            return "Genus"
        case .order:
            return "Order"

        }
    }
}
