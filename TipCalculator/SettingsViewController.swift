//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Shobana Ramesh on 9/25/16.
//  Copyright © 2016 Shobana Ramesh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultChoice: UISegmentedControl!
//    let color = UIColor.blueColor()
//    let defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard;
        let getChoice = defaults.integer(forKey: "tipPercent")
        defaultChoice.selectedSegmentIndex = getChoice

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveChoice(_ sender: AnyObject) {

        let defaults = UserDefaults.standard;
        defaults.set(defaultChoice.selectedSegmentIndex, forKey:"tipPercent")
        defaults.synchronize()
    }
    
//    @IBAction func theme(_ sender: AnyObject) {
//        let style = UserDefaults.standard;
//        
//       style.set(color,forKey:"blue")
//        defaults.synchronize()
//
//    }
//    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
