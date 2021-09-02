//
//  TripDetailViewController.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//

import UIKit

class TodoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var destinoLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var trip: Trip!
    
    func configure(tabBarController: TabBarController) {
        self.trip = tabBarController.trip
        
        destinoLabel.text = trip.cidade
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        
        let dateChegada = dateFormatter.string(from: trip.dataChegada!)
        let dateSaida = dateFormatter.string(from: trip.dataSaida!)
        
        dateLabel.text = "\(dateChegada) - \(dateSaida)"
    }
    
}

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
