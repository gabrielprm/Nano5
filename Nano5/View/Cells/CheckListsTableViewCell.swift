//
//  CheckListsTableViewCell.swift
//  Nano5
//
//  Created by João Victor on 30/08/21.
//

import UIKit

class CheckListsTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet var cellTitle: UILabel!
    var tableView: TodoItemViewController!
    var todoItem: TodoItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "AccentColor")
        
        selectedBackgroundView = backgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButton(_ sender: Any) {
        todoItem.isCompleted = !todoItem.isCompleted
        checkButton.isSelected = todoItem.isCompleted
        tableView.saveTodo()
        tableView.fetchToDo()
    }
}
