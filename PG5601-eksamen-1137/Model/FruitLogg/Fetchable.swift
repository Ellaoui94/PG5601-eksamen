//
//  Fetchable.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 21/11/2022.
//

import UIKit
import CoreData

protocol Fetchable {
    
    static var entityName : String { get }
    
    static func allObjects(inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [Self]
    
}
