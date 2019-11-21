//
//  ResultVC.swift
//  Tipsy
//
//  Created by Old Mac on 11/19/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amountPerPerson = 0.0
    var tipPercentage = 10.0
    var numberOfPeople = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", amountPerPerson)
        settingsLabel.text = "Split between \(String(format: "%.0f", numberOfPeople)) people, with \(String(format: "%.0f", tipPercentage))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
