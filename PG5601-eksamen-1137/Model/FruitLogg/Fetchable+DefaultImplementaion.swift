//
//  Fetchable+DefaultImplementaion.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import UIKit
import CoreData

extension Fetchable where Self : NSManagedObject {
    
    static func allObjects(inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [Self] {
        let fetchRequest = NSFetchRequest<Self>(entityName: entityName)
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch {
            print("An error occurred")
            return [Self]()
        }
    }
}
