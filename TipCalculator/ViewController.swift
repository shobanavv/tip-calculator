//
//  ViewController.swift
//  TipCalculator
//
//  Created by Shobana Ramesh on 9/25/16.
//  Copyright © 2016 Shobana Ramesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true

        let defaults = UserDefaults.standard;
        let getChoice = defaults.integer(forKey: "tipPercent")
        percentControl.selectedSegmentIndex = getChoice
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard;
        let billAmount = defaults.string(forKey: "billAmount")
        billField.text = billAmount
        
        updateTotal(bill: Double(billAmount!) ?? 0, tipPercentIndex: Int(percentControl.selectedSegmentIndex))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        updateTotal(bill: bill, tipPercentIndex: Int(percentControl.selectedSegmentIndex))
        
        let defaults = UserDefaults.standard;
        defaults.set(billField.text, forKey:"billAmount")
    }
    
    func currencyFormat(value: NSNumber) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: value)!
    }
    
    func updateTotal(bill: Double, tipPercentIndex: Int) {
        let tipPercent = [0.08,0.1,0.15,0.20]
        
        let tip = bill * tipPercent[tipPercentIndex]
        let total = bill + tip
        
        tipLabel.text = self.currencyFormat(value: NSNumber(value: tip))  // ( String(format: "$%.2f", tip)
        totalLabel.text = self.currencyFormat(value: NSNumber(value: total))  // String(format: "$%.2f", total)
    }

    
}

