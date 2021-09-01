//
//  ViewController.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 30/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "TripsTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "TripsCells")
        tableView.dataSource = self
        
        tableView.rowHeight = tableView.dequeueReusableCell(withIdentifier: "TripsCells")!.bounds.height
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripsCells", for: indexPath) as? TripsTableViewCell else { fatalError("teste") }
        
        cell.titleLabel.text = "Placeholder"
        cell.dateLabel.text = "Date"
        cell.thumbImage.image = UIImage(named: "Rectangle 27")
        
        return cell
    }
    
}
