//
//  ViewController.swift
//  moneyConvert
//
//  Created by 김은진 on 08/11/2017.
//  Copyright © 2017 BlissBless. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var currencySegment: UISegmentedControl!
 
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    @IBOutlet weak var explainStringLabel: UILabel!
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sourceMoneyFieldDidChange(_ sender: UITextField) { // 숫자가 입력 됐을 때, 지워 졌을 때, 두 경우
       
        if sourceMoneyField.text != "" {
            calculate()
        } else {
            makeZero()
        }
    }
    
    @IBAction func currencyChagned(_ sender: UISegmentedControl) {
        calculate()
    }

    
    @objc func calculate() {

        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else {
            print("source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            sourceMoneyField.text = ""
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
        var targetMoneyString: String = ""
        
        for i in 0...3 {
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        targetMoneyLabel.text = targetMoneyString
        
        explainStringLabel.text = sourceMoney.explainString(moneyText: sourceMoneyField.text!, currency: Currency.init(rawValue: currencySegment.selectedSegmentIndex)!)
    }
    
    func makeZero() {
        sourceMoneyField.text = "0"
        calculate()
    }

}









