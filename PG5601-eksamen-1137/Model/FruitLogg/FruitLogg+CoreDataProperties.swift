//
//  FruitLogg+CoreDataProperties.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//
//

import Foundation
import CoreData


extension FruitLogg {
    
    @NSManaged public var name: String?
    @NSManaged public var sugar: Double
    @NSManaged public var protein: Double
    @NSManaged public var carbohydrates: Double
    @NSManaged public var fat: Double
    @NSManaged public var calories: Double
    @NSManaged public var sum: Double
    @NSManaged public var date: String
    
}

