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
    
    var tip = 0.10
    var isOn = false
    
    override func viewDidLoad() {
        activateButton(bool: true, button: tenButton)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {

        activateButton(bool: false, button: zeroButton)
        activateButton(bool: false, button: tenButton)
        activateButton(bool: false, button: twentyButton)
        activateButton(bool: true, button: sender)
        
        let title = sender.currentTitle ?? "Error"
        let titleMinusSign = String(title.dropLast())
        let titleAsNumber = Double(titleMinusSign) ?? 0.0
        tip = titleAsNumber/100
        
    }
    
    func activateButton(bool: Bool, button: UIButton){
        isOn = bool
        let backgroundColor = bool ? UIColor(red:0.00, green:0.69, blue:0.42, alpha:1.0) : .clear
        let titleColor = bool ? .white : UIColor(red:0.00, green:0.69, blue:0.42, alpha:1.0)
         button.layer.cornerRadius = 10
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
    }
    
    @IBAction func stepperBalueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
    }
}

