//
//  TodoList+CoreDataProperties.swift
//  Nano5
//
//  Created by Johnny Camacho on 31/08/21.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var item: [TodoItem]?
    @NSManaged public var titulo: String?
    @NSManaged public var trip: Trip?

}

extension TodoList : Identifiable {

}
