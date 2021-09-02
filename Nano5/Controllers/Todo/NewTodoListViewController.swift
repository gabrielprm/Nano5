//
//  NewTodoListViewController.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 02/09/21.
//

import UIKit

class NewTodoListViewController: UIViewController {
    
    var todoListViewControler: TodoListViewController!
    
    @IBOutlet var todoListTitle: UITextField!
    
    @IBOutlet var todoListDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func todoListSaveButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Campo vazio", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        guard todoListTitle.text != "" else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        let todoList = TodoList(context: todoListViewControler.context)
        
        todoList.titulo = todoListTitle.text
        todoListViewControler.trip.addToTodoList(todoList)
        
        do {
            try self.todoListViewControler.context.save()
        } catch {
            fatalError("Error saving To-do List")
        }
        
        todoListViewControler.fetchToDo()
        
        dismiss(animated: true, completion: nil)
    }
}
