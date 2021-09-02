//
//  NewTripViewController.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//

import UIKit

class NewTripViewController: UIViewController {
    
    var tripsViewController: TripViewController!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var chegadaDatePicker: UIDatePicker!
    
    @IBOutlet weak var saidaDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Campo vazio", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        guard cityTextField.text != "" else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        let trip = Trip(context: tripsViewController.context)
        
        trip.cidade = cityTextField.text
        trip.dataChegada = chegadaDatePicker.date
        trip.dataSaida = saidaDatePicker.date
        
        tripsViewController.saveTrips()
        
        dismiss(animated: true, completion: nil)
    }
    
}
