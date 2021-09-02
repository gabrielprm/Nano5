//
//  NewToDoItemViewController.swift
//  Nano5
//
//  Created by João Victor on 02/09/21.
//

import Foundation
import UIKit


class NewToDoItemViewController: UIViewController{
    
    //MARK: --Properties
    
    var todoItemViewControler: TodoItemViewController!
    
    @IBOutlet weak var titleField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: --LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: --Helpers
    
    @IBAction func didTapSave(_ sender: Any) {
        
        let alert = UIAlertController(title: "Campo Vazio", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        guard titleField.text != "" else{
            present(alert, animated: true, completion: nil)
            return
        }
        
        let todoItem = TodoItem(context:context)
        
        todoItem.titulo = titleField.text
        todoItem.isCompleted = false
        
        todoItemViewControler.todoList.addToTodoItem(todoItem)
        
        todoItemViewControler.saveTodo()
        
        todoItemViewControler.fetchToDo()
        
        dismiss(animated: true, completion: nil)
    }
}
