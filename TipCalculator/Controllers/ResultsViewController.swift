//
//  ResultsViewController.swift
//  TipCalculator
//
//  Created by Emre Sahin on 8.03.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var results: String?
    var numberOfPeople: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = results
        settingsLabel.text = "Split between \(numberOfPeople ?? "Error") people, with \(tip ?? "Error")% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
