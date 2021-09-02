//
//  TodoItemViewController.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 02/09/21.
//

import UIKit

class TodoItemViewController: UIViewController {
    
    //MARK: -- Properties
    var todoList: TodoList!

    @IBOutlet var todoListTitle: UILabel!
    
    @IBOutlet var todoItemTableView: UITableView!
     
    var todoItem: [TodoItem]?
    
    //MARK: --Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CheckListsTableViewCell", bundle: nil)
        
        todoItemTableView.register(nib, forCellReuseIdentifier: "ToDoItemCell")
        todoItemTableView.delegate = self
        todoItemTableView.dataSource = self
        
        todoItemTableView.rowHeight = todoItemTableView.dequeueReusableCell(withIdentifier: "ToDoItemCell")!.bounds.height
        
        configureUI()
    }
    
    func configureUI() {
        todoListTitle.text = todoList.titulo
    }
    
    //MARK: --Helpers
    @IBAction func addItemButton(_ sender: Any) {
    }
}

//MARK: --Extensions

extension TodoItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

extension TodoItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? CheckListsTableViewCell  else {
            fatalError("Error dequeing cell")
        }
        
        let todoCell = self.todoItem![indexPath.section]
        
        cell.cellTitle.text = todoCell.titulo
        
        return cell
        
    }
}
