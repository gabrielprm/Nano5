import Foundation
import UIKit

class NewToDoItemViewController: UIViewController{
    
    //MARK: --Properties
    @IBOutlet weak var titleField: UITextField!
    
    var todoItemViewControler: TodoItemViewController!
    
    //MARK: --LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: --Helpers
    
    @IBAction func didTapSave(_ sender: Any) {
        
        guard titleField.text != "" else {
            let alert = UIAlertController(title: "Campo Vazio", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        let todoItem = TodoItem(context: todoItemViewControler.context)
        
        todoItem.titulo = titleField.text
        todoItem.isCompleted = false
        
        todoItemViewControler.todoList.addToTodoItem(todoItem)
        todoItemViewControler.saveTodo()
        todoItemViewControler.fetchToDo()
        
        dismiss(animated: true, completion: nil)
    }
    
}
