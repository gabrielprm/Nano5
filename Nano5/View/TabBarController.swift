//
//  TabBarViewController.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    static let tabBarSegueIdentifier = "TabBarSegueIdentifier"
    
    var todoListViewController: TodoListViewController!
    var eventsViewController: EventsViewController!
    var flightViewController: FlightViewController!
    var profileViewController: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        selectedIndex = 0
        
        todoListViewController = viewControllers![0] as? TodoListViewController
        eventsViewController = viewControllers![1] as? EventsViewController
        flightViewController = viewControllers![2] as? FlightViewController
        profileViewController = viewControllers![3] as? ProfileViewController
        
        todoListViewController.configure(tabBarController: self)
    }
    
    var trip: Trip!
    
    func configure(_ trip: Trip) {
        self.trip = trip
    }
    
}
