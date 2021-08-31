//
//  todoItem.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 31/08/21.
//

import Foundation


public class TodoItem: NSObject, NSCoding{

    var titulo: String
    var isCompleted: Bool
    
    public func encode(with coder: NSCoder) {
        
    }
    
    public required init?(coder: NSCoder) {
        <#code#>
    }
}
