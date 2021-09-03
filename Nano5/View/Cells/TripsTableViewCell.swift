//
//  TableViewCell.swift
//  Nano5
//
//  Created by João Victor on 30/08/21.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    static let tripCellIdentifier = "TripsCells"

    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
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
        favoriteButton.isSelected = !favoriteButton.isSelected
    }
}
