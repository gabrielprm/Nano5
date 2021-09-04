//
//  TripDetailViewController.swift
//  Nano5
//
//  Created by Me on 01/09/21.
//

import UIKit

class TodoListViewController: UIViewController {
    
    
    //MARK: --Properties
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var destinoLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var trip: Trip!
    
    var todoList: [TodoList]?
    
    
    //MARK: --Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "ToDoCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!.bounds.height
    }
    
    //MARK: --Helpers
    
    @IBAction func didTapBackButton(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(identifier: "trips") as! TripViewController
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    func configure(trip: Trip) {
        
        self.trip = trip
        
        destinoLabel.text = trip.cidade
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        
        let dateChegada = dateFormatter.string(from: trip.dataChegada!)
        let dateSaida = dateFormatter.string(from: trip.dataSaida!)
        
        dateLabel.text = "\(dateChegada) - \(dateSaida)"
        
        fetchToDo()
    }
    
    func fetchToDo() {
        self.todoList = trip.todoList!.allObjects as? [TodoList] // or as!
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func saveTodo() {

        do {
            try self.context.save()
        } catch {
            fatalError("Error thrown at deletion: SAVE")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "NewTodoListSegueIdentifier",
           let destination = segue.destination as? NewTodoListViewController {
            
            destination.todoListViewControler = self
        } else if segue.identifier == "TodoItemList",
                  let destination = segue.destination as? TodoItemViewController,
                  let todoList = sender as? TodoList {

            destination.todoList = todoList
        }
        
    }
    
}


//MARK: --Extensions
extension TodoListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoTableViewCell else {
            fatalError("ERROR fetching data.")
        }
        
        let todoCell = self.todoList![indexPath.section]
        
        cell.todoListLabel.text = todoCell.titulo
        
        return cell
    }
    
}

extension TodoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todoList = todoList![indexPath.section]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "TodoItemList", sender: todoList)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete" ) { (action, view, completionHandler) in
            
            let listToDelete = self.todoList![indexPath.section]
            
            self.context.delete(listToDelete)
            
            self.saveTodo()
            
            self.fetchToDo()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
