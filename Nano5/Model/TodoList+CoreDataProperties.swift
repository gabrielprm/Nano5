//
//  TodoList+CoreDataProperties.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var item: TodoItem?
    @NSManaged public var titulo: String?
    @NSManaged public var trip: Trip?
    @NSManaged public var todoItem: NSSet?

}

// MARK: Generated accessors for todoItem
extension TodoList {

    @objc(addTodoItemObject:)
    @NSManaged public func addToTodoItem(_ value: TodoItem)

    @objc(removeTodoItemObject:)
    @NSManaged public func removeFromTodoItem(_ value: TodoItem)

    @objc(addTodoItem:)
    @NSManaged public func addToTodoItem(_ values: NSSet)

    @objc(removeTodoItem:)
    @NSManaged public func removeFromTodoItem(_ values: NSSet)

}

extension TodoList : Identifiable {

}
