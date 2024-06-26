import UIKit

class TodoItemViewController: UIViewController {
    
    //MARK: -- Properties
    @IBOutlet var todoListTitle: UILabel!
    
    @IBOutlet var todoItemTableView: UITableView!
    
    var todoList: TodoList!
    
    var todoItem: [TodoItem]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: --Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CheckListsTableViewCell", bundle: nil)
        
        todoItemTableView.register(nib, forCellReuseIdentifier: "ToDoItemCell")
        todoItemTableView.delegate = self
        todoItemTableView.dataSource = self
        
        todoItemTableView.rowHeight = todoItemTableView.dequeueReusableCell(withIdentifier: "ToDoItemCell")!.bounds.height
        
        fetchToDo()
        
        configureUI()
    }
    
    //MARK: --Helpers
    
    func configureUI() {
        todoListTitle.text = todoList.titulo
    }
    
    func fetchToDo() {
        self.todoItem = todoList.todoItem!.allObjects as? [TodoItem]
        
        DispatchQueue.main.async {
            self.todoItemTableView.reloadData()
        }
    }
    
    func saveTodo() {
        
        do {
            try self.context.save()
        } catch {
            fatalError("Error Saving Trips")
        }
        
    }
}

//MARK: --Extensions

extension TodoItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoItemViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? CheckListsTableViewCell else {
            fatalError("Error dequeing cell")
        }
        
        let todoCell = self.todoItem![indexPath.section]
        
        cell.tableView = self
        cell.todoItem = todoCell
        cell.cellTitle.text = todoCell.titulo
        cell.checkButton.isSelected = todoCell.isCompleted
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NewToDoItemSegueIdentifier",
           let destination = segue.destination as? NewToDoItemViewController {
            
            destination.todoItemViewControler = self
        }
    }
    
}
