//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rukhsar Jamati on 06/05/2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total : String?
    var totalPeople : Int?
    var tipText : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = total!
        settingsLabel.text = "Split between \(totalPeople!) people, with \(tipText!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
