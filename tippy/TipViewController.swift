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
    static let TIP_INDEX_KEY = "tip_index_key"
    static let TIME_KEY = "time_key"
    
    let tipPercentages = [0.18, 0.2, 0.22]
    
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        // Do any additional setup after loading the view, typically from a nib.
        billTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        loadData()
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        
        let index = defaults.integer(forKey: ViewController.TIP_INDEX_KEY)
        tipsSegmentedControl.selectedSegmentIndex = index
        let timeStamp = Date().timeIntervalSince1970 - defaults.double(forKey: ViewController.TIME_KEY)
        if (timeStamp <= Double(600)) {
            let bill = defaults.double(forKey: ViewController.BILL_KEY)
            if (bill > 0) {
                if (floor(bill) == bill) {
                    billTextField.text = String(Int(bill))
                } else {
                    billTextField.text = String(bill)
                }
                showData()
            }
        }
        
        showViews(duration: 0)
    }
    
    func showViews(duration: Double) {
        if (billTextField.text?.isEmpty)! {
            UIView.animate(withDuration: duration, animations: {
                // bill text
            //    self.billTextField.center = CGPoint(x: self.dollarLabel.center.x, y: self.dollarLabel.center.y + 90)
                // tip view
                self.tipView.alpha = 0
                // tip percentage
                self.tipsSegmentedControl.alpha = 0
                // dollar label
                self.dollarLabel.alpha = 1
            //    self.dollarLabel.center = CGPoint(x: self.dollarLabel.center.x - 70, y: self.dollarLabel.center.y)
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                // bill text
           //     self.billTextField.center = CGPoint(x: self.dollarLabel.center.x, y: self.dollarLabel.center.y - 90)
                // tip view
                self.tipView.alpha = 1
                // tip percentage
                self.tipsSegmentedControl.alpha = 1
                // dollar label
                self.dollarLabel.alpha = 0
           //     self.dollarLabel.center = CGPoint(x: self.dollarLabel.center.x - 70, y: self.dollarLabel.center.y)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        showData()
        saveData()
        showViews(duration: 0.4)
    }
    
    func showData() {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipsSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
    }

    func saveData() {
        let defaults = UserDefaults.standard
        let bill = Double(billTextField.text!) ?? 0
        defaults.set(bill, forKey: ViewController.BILL_KEY)
        defaults.set(Date().timeIntervalSince1970, forKey: ViewController.TIME_KEY)
        defaults.synchronize()
    }
}

