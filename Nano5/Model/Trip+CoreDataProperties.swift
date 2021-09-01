//
//  Trip+CoreDataProperties.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var cidade: String?
    @NSManaged public var dataChegada: Date?
    @NSManaged public var dataSaida: Date?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var thumbnail: String?
    @NSManaged public var event: NSSet?
    @NSManaged public var todoList: NSSet?

}

// MARK: Generated accessors for event
extension Trip {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: Events)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: Events)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

// MARK: Generated accessors for todoList
extension Trip {

    @objc(addTodoListObject:)
    @NSManaged public func addToTodoList(_ value: TodoList)

    @objc(removeTodoListObject:)
    @NSManaged public func removeFromTodoList(_ value: TodoList)

    @objc(addTodoList:)
    @NSManaged public func addToTodoList(_ values: NSSet)

    @objc(removeTodoList:)
    @NSManaged public func removeFromTodoList(_ values: NSSet)

}

extension Trip : Identifiable {

}
