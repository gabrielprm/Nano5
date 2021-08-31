//
//  todoItem.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 31/08/21.
//

import Foundation

public class TodoItem: NSObject {

    var titulo: String
    var isCompleted: Bool
    
    init(titulo: String, isCompleted: Bool) {
        self.titulo = titulo
        self.isCompleted = isCompleted
    }
    
}
