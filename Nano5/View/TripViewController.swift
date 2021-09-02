//
//  ViewController.swift
//  Nano5
//
//  Created by Gabriel do Prado Moreira on 30/08/21.
//

import UIKit
import CoreData

class TripViewController: UIViewController {
    
    static let newTripSegueIdentifier = "NewTripSegueIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var trips: [Trip]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "TripsTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: TripsTableViewCell.tripCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.tripCellIdentifier)!.bounds.height
        
        fetchTrips()
    }
    
    func fetchTrips() {
        do {
            let request = Trip.fetchRequest() as NSFetchRequest<Trip>
            
            try self.trips = context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            fatalError("Deu doidera.")
        }
    }
    
    func saveTrips() {
        do {
            try self.context.save()
        } catch {
            fatalError("Ish.")
        }
        
        self.fetchTrips()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.newTripSegueIdentifier,
           let destination = segue.destination as? NewTripViewController {
            
            destination.tripsViewController = self
        } else if segue.identifier == TabBarController.tabBarSegueIdentifier,
                  let destination = segue.destination as? TabBarController,
                  let trip = sender as? Trip {

            destination.configure(trip)
        }
    }
    
}

extension TripViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Redirection to todo list Trip.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = trips![indexPath.section]
        
        performSegue(withIdentifier: TabBarController.tabBarSegueIdentifier, sender: trip)
    }
    
    // Read Trip.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.tripCellIdentifier, for: indexPath) as? TripsTableViewCell else {
            fatalError("Deu doidera dnv.")
        }
        
        let trip = trips![indexPath.section]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        
        let dateChegada = dateFormatter.string(from: trip.dataChegada!)
        let dateSaida = dateFormatter.string(from: trip.dataSaida!)
        
        cell.titleLabel.text = trip.cidade
        cell.dateLabel.text = "\(dateChegada) - \(dateSaida)"
        cell.thumbImage.image = UIImage(named: "Rectangle 27")
        
        return cell
    }
    
    // Update Trip.
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let tripToUpdate = self.trips![indexPath.section]
        let alertController = UIAlertController(title: "Update trip", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.text = tripToUpdate.cidade
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert in
            let cidadeTextField = alertController.textFields![0] as UITextField

            tripToUpdate.cidade = cidadeTextField.text

            self.saveTrips()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        let update = UIContextualAction(style: .normal, title: "Update", handler: { action, view, completionHandler in
            
            self.present(alertController, animated: true, completion: nil)
            
        })
        
        update.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [update])
    }
    
    // Delete Trip.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: { action, view, completionHandler in
            let tripToRemove = self.trips![indexPath.section]
            
            self.context.delete(tripToRemove)
            
            self.saveTrips()
        })
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let personToRemove = self.trips![indexPath.section]
//
//            self.context.delete(personToRemove)
//
//            self.saveTrips()
//        }
//    }
    
}
