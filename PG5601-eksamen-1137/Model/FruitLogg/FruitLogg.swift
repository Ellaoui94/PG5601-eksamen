//
//  FruitLogg.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import Foundation
import CoreData

@objc
final class FruitLogg: NSManagedObject, Fetchable {
    
    static var entityName = "FruitLogg"
    
    static func insertFruitLoggtWithName(_ name: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> FruitLogg {
        let fruitLogg = FruitLogg(entity: NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext)!, insertInto: managedObjectContext)
        fruitLogg.name = name
        return fruitLogg
    }

//    static func averageGrade(inManagedObjectContext managedObjectContext: NSManagedObjectContext = ModelManager.sharedManager.persistentContainer.viewContext) -> Float {
//        let fruitLogg = FruitLogg.allObjects(inManagedObjectContext: managedObjectContext)
//
//        var totalGrade : Float = 0
//        for student in students {
//            totalGrade += student.grade!.floatValue
//        }
//        return totalGrade / Float(students.count)
//
//    }
//
    convenience init?(attributes: [String: AnyObject], inManagedObjectContext managedObjectContext: NSManagedObjectContext = ModelManager.sharedManager.persistentContainer.viewContext) {
        
        
        guard let actualName = attributes["name"] as? String else {
            return nil
        }
        
//        guard let actualGrade = attributes["grade"] as? NSNumber else {
//            return nil
//        }
//
//        guard let yearStarted = attributes["yearStarted"] as? String else {
//            return nil
//        }
//
//        guard let bachelorProgram = attributes["bachelorProgram"] as? String else {
//            return nil
//        }
//
        self.init(entity: NSEntityDescription.entity(forEntityName: FruitLogg.entityName, in: managedObjectContext)!, insertInto: managedObjectContext)
        self.name = actualName
    }
    
    
    
}
