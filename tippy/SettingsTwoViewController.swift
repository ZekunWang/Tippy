//
//  SettingsTwoViewController.swift
//  tippy
//
//  Created by Zekun Wang on 9/24/16.
//  Copyright © 2016 Zekun Wang. All rights reserved.
//

import UIKit

class SettingsTwoViewController: UIViewController {
    
    static let TIP_INDEX_KEY = "tip_index_key"
    
    let tipPercentages = [0.18, 0.2, 0.22]
    
    @IBOutlet var tipsSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        loadData()
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: SettingsTwoViewController.TIP_INDEX_KEY)
        tipsSegmentedControl.selectedSegmentIndex = index
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTipChanged(_ sender: AnyObject) {
        saveDate()
    }
    
    func saveDate() {
        let defaults = UserDefaults.standard
        let index = tipsSegmentedControl.selectedSegmentIndex
        defaults.set(index, forKey: SettingsTwoViewController.TIP_INDEX_KEY)
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
