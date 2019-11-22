//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 10.0
    var isOn = false
    var numberOfPeople = 2.0
    var billAmount = 0.0
    var amountPerPerson = 0.0
    
    override func viewDidLoad() {
      
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        dismissKeyboard()
        
        zeroButton.isSelected = false
               tenButton.isSelected = false
               twentyButton.isSelected = false
               sender.isSelected = true
//
//        activateButton(bool: false, button: zeroButton)
//        activateButton(bool: false, button: tenButton)
//        activateButton(bool: false, button: twentyButton)
//        activateButton(bool: true, button: sender)
        
        let title = sender.currentTitle ?? "Error"
        let titleMinusSign = String(title.dropLast())
        tip = Double(titleMinusSign) ?? 0.0
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @IBAction func stepperBalueChanged(_ sender: UIStepper) {
        dismissKeyboard()
        numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func billAmountChanged(_ sender: UITextField) {
        if let billAmountString = sender.text {
            billAmount = Double(billAmountString)!
        }
      }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        amountPerPerson = billAmount*(1+tip/100) / numberOfPeople
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinatonVC = segue.destination as! ResultVC //downcasting
            destinatonVC.amountPerPerson = amountPerPerson
            destinatonVC.numberOfPeople = numberOfPeople
            destinatonVC.tipPercentage = tip
        }
    }
  
}

