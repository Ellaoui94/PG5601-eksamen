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

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FruitLogg> {
        return NSFetchRequest<FruitLogg>(entityName: "FruitLogg")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateLogg: Date?
    @NSManaged public var fat: Double
    @NSManaged public var sugar: Double
    @NSManaged public var calories: Double
    @NSManaged public var carbohydrates: Double
    @NSManaged public var protein: Double

}

extension FruitLogg : Identifiable {

}
