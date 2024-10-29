import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoListLabel: UILabel!
    
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
    
}
