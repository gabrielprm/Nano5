//
//  NewTripViewController.swift
//  Nano5
//
//  Created by Johnny Camacho on 01/09/21.
//

import UIKit

class NewTripViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var chegadaDatePicker: UIDatePicker!
    
    @IBOutlet weak var saidaDatePicker: UIDatePicker!
    
    var tripsViewController: TripViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        guard cityTextField.text != "" else {
            let alert = UIAlertController(title: "Empty Field", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        let trip = Trip(context: tripsViewController.context)
        
        trip.cidade = cityTextField.text
        trip.dataChegada = chegadaDatePicker!.date
        trip.dataSaida = saidaDatePicker!.date
        
        if trip.dataChegada! > trip.dataSaida! {
            let alert = UIAlertController(title: "Departure date is bigger than arrival date!\n Please set date again.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        tripsViewController.saveTrips()
        tripsViewController.fetchTrips()
        
        dismiss(animated: true, completion: nil)
    }
    
}
