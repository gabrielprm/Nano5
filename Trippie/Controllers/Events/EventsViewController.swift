import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    var trip: Trip?
    
    var events: [Events]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "EventsTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "EventCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = tableView.dequeueReusableCell(withIdentifier: "EventCell")!.bounds.height
        
        fetchEvents()
    }
    
    func fetchEvents() {
        self.events = trip?.event?.allObjects as? [Events]
        
        if events == nil || events?.count == 0 {
            SerpApi.requestEvent(eventsViewController: self)
            
            print("Eventos consumidos pela API.")
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func saveEvents() {
        do {
            try context?.save()
        } catch {
            fatalError("ERROR ao salvar.")
        }
    }
    
    func configure(trip: Trip) {
        self.trip = trip
    }
    
}

extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension EventsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventsTableViewCell else {
            fatalError("ERROR")
        }
        
        let event = events![indexPath.section]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        
        let date = dateFormatter.string(from: event.dataInicio!)
        
        cell.nameEvent.text = event.titulo
        cell.valueEvent.text = "R$80,00"
        cell.dateEvent.text = date
        
        DispatchQueue.global(qos: .background).async {
            let urlThumb = URL(string: event.thumbnail!)!
            let dataImage = try! Data(contentsOf: urlThumb)
            
            DispatchQueue.main.async {
                
                cell.thumbnail.image = UIImage(data: dataImage)
            }
        }
        
        return cell
    }
    
}
