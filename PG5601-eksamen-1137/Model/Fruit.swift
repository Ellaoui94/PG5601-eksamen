//
//  Fruit.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 12/11/2022.
//

//{\n    \"genus\": \"Rubus\",\n    \"name\": \"Raspberry\",\n    \"id\": 23,\n    \"family\": \"Rosaceae\",\n    \"order\": \"Rosales\",\n    \"nutritions\": {\n        \"carbohydrates\": 12,\n        \"protein\": 1.2,\n        \"fat\": 0.7,\n        \"calories\": 53,\n        \"sugar\": 4.4\n    }\n},
import Foundation

struct Fruit: Codable {
    let genus: String
    let name: String
    let id: Int
    let family: String
    let order: String
    let nutritions: Nutritions
}

struct Nutritions: Codable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Double
    let sugar: Double
}


