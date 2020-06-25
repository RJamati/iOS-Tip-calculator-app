//
//  ViewController.swift
//  Tipsy
//
//  Created by Rukhsar Jamati on 09/09/2019.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.10
    var numberOfPeople = 2
    var billTotalAmount = 0.0
    var splitAmount = 0.0
    var finalSplitAmount = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //make the button selected
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        //Removing the last character and converting into String
        let removePercentSign = String(buttonTitle.dropLast())
        
        //Turn the String into Double and then divide it to convert into decimal
        tip = (Double(removePercentSign)!) / 100
        print (tip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        //print (sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let bill = billTextField.text!
        
        if (bill != ""){
        
            billTotalAmount = Double(bill)!
            splitAmount = billTotalAmount * (1 + tip) / Double(numberOfPeople)
            print(splitAmount)
            finalSplitAmount = String(format: "%.2f", splitAmount)
           // let resultTo2DecimalPlace = String(format: ".2f", splitAmount)
            
            self.performSegue(withIdentifier: "goToResult", sender: "self")
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = finalSplitAmount
            destinationVC.totalPeople = numberOfPeople
            destinationVC.tipText = Int(tip * 100)
            
        }
    }
    
}

