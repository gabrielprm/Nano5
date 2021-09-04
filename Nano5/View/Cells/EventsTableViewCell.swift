//
//  EventsTableViewCell.swift
//  Nano5
//
//  Created by João Victor on 30/08/21.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var nameEvent: UILabel!
    
    @IBOutlet weak var dateEvent: UILabel!
    
    @IBOutlet weak var valueEvent: UILabel!
    
    @IBOutlet weak var favoritedEvent: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
