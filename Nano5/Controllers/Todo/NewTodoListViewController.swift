import UIKit

class NewTodoListViewController: UIViewController {
    
    @IBOutlet var todoListTitle: UITextField!
    
    @IBOutlet var todoListDescription: UITextView!
    
    var todoListViewControler: TodoListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func todoListSaveButton(_ sender: Any) {
        
        guard todoListTitle.text != "" else {
            let alert = UIAlertController(title: "Campo vazio", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        let todoList = TodoList(context: todoListViewControler.context)
        
        todoList.titulo = todoListTitle.text
        
        todoListViewControler.trip.addToTodoList(todoList)
        todoListViewControler.saveTodo()
        todoListViewControler.fetchToDo()
        
        dismiss(animated: true, completion: nil)
    }
}
