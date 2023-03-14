//
//  ViewController.swift
//  TipCalculator
//
//  Created by Emre Sahin on 8.03.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 0
    var bill = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        
        let buttonTitle = Double(sender.currentTitle!.dropLast())!
        tip = buttonTitle/100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.isSelected = true
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Double(billTextField.text!)!
        bill = bill + (bill*tip)
        bill /= Double(numberOfPeople)
        tip = tip*100
        
        performSegue(withIdentifier: "ResultVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultVC"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = String(format: "%.0f", tip)
            destinationVC.numberOfPeople = String(numberOfPeople)
            destinationVC.results = String(format: "%.2f", bill)
        }
    }
    
}

