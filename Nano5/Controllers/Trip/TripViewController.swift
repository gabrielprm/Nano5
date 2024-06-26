import UIKit
import CoreData

class TripViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    static let newTripSegueIdentifier = "NewTripSegueIdentifier"
    
    static var trips: [Trip]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
            let sortFavorite = NSSortDescriptor(key: "isFavorite", ascending: false)
            let sortName = NSSortDescriptor(key: "dataChegada", ascending: true)
            
            request.sortDescriptors = [sortFavorite, sortName]
            
            try TripViewController.trips = context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            fatalError("Error fetching trips.")
        }
        
    }
    
    func saveTrips() {

        do {
            try self.context.save()
        } catch {
            fatalError("Error saving trips.")
        }

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
        return TripViewController.trips?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Redirection to todo list Trip.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = TripViewController.trips![indexPath.section]
        
        performSegue(withIdentifier: TabBarController.tabBarSegueIdentifier, sender: trip)
    }
    
    // Read Trip.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.tripCellIdentifier, for: indexPath) as? TripsTableViewCell else {
            fatalError("Error reading cell")
        }
        
        let trip = TripViewController.trips![indexPath.section]
        
        cell.tripsViewController = self
        cell.trip = trip
        
        cell.titleLabel.text = trip.cidade
        cell.dateLabel.text = cell.formatDate()
        cell.favoriteButton.isSelected = trip.isFavorite
        
        if let image = trip.thumbnailImage {
            cell.thumbImage.image = image
        } else {
            cell.thumbImage.image = UIImage()
            
            Unsplash.requestImage(cell: cell, trip: trip)
        }
        
        return cell
    }
    
    // Update Trip.
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let tripToUpdate = TripViewController.trips![indexPath.section]
        let alertController = UIAlertController(title: "Update trip", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.text = tripToUpdate.cidade
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert in
            let cidadeTextField = alertController.textFields![0] as UITextField

            tripToUpdate.cidade = cidadeTextField.text

            self.saveTrips()
            self.fetchTrips()
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
            let tripToRemove = TripViewController.trips![indexPath.section]
            
            self.context.delete(tripToRemove)
            
            self.saveTrips()
            self.fetchTrips()
        })
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

