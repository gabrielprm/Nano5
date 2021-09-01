//
//  TodoItem+CoreDataProperties.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "TodoItem")
    }

    @NSManaged public var titulo: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var todoList: TodoList?

}

extension TodoItem : Identifiable {

}
