//
//  ViewController.swift
//  tippy
//
//  Created by Zekun Wang on 9/24/16.
//  Copyright © 2016 Zekun Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let BILL_KEY = "bill_key"
    static let TIME_KEY = "time_key"
    
    let tipPercentages = [0.18, 0.2, 0.22]
    
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipsSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }

}

