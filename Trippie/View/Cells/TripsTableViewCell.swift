import UIKit

class TripsTableViewCell: UITableViewCell {
    
    static let tripCellIdentifier = "TripsCells"

    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tripsViewController: TripViewController!
    var trip: Trip!
    
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
    
    @IBAction func favoriteTapped(_ sender: Any) {
        trip.isFavorite = !trip.isFavorite
        
        favoriteButton.isSelected = trip.isFavorite
        
        tripsViewController.saveTrips()
        tripsViewController.fetchTrips()
    }
    
    func formatDate() -> String {
        guard let trip = trip else {
            fatalError("Trip não atribuida.")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        
        let dateChegada = dateFormatter.string(from: trip.dataChegada!)
        let dateSaida = dateFormatter.string(from: trip.dataSaida!)
        
        return "\(dateChegada) - \(dateSaida)"
    }

}

