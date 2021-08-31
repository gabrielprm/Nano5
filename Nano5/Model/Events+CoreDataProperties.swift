//
//  Events+CoreDataProperties.swift
//  Nano5
//
//  Created by Johnny Camacho on 31/08/21.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var dataInicio: Date?
    @NSManaged public var descricao: String?
    @NSManaged public var endereco: String?
    @NSManaged public var horaInicio: Date?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var thumbnail: String?
    @NSManaged public var titulo: String?
    @NSManaged public var event: NSSet?

}

// MARK: Generated accessors for event
extension Events {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: Trip)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: Trip)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

extension Events : Identifiable {

}
