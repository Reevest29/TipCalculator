//
//  ViewController.swift
//  TipCalculator
//
//  Created by user145843 on 4/6/19.
//  Copyright © 2019 T3Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billInutField: UITextField!
    @IBOutlet weak var tipOutputLabel: UILabel!
    @IBOutlet weak var totalTipOutputLabel: UILabel!
    @IBOutlet weak var tipPrecentagesBar: UISegmentedControl!
    var sign = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        let currencyCode = locale.currencyCode!
        sign = currencySymbol
        print(sign)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billInutField.text ?? "0")
        var tipPercent = 0.0
        if tipPrecentagesBar.selectedSegmentIndex == 0{
            tipPercent = 0.15
        }
        else if tipPrecentagesBar.selectedSegmentIndex == 1{
            tipPercent = 0.20
        }
        else if tipPrecentagesBar.selectedSegmentIndex == 2{
            tipPercent = 0.22
        }
        var tip = (bill ?? 0) * tipPercent

        tip = Double(round(100*tip)/100)
        var str = String(tip)
        var decPos = str.firstIndex(of: ".")
        var strTip = ""
        var strTot = String(tip + (bill ?? 0 ))
        var decPos2 = strTot.firstIndex(of: ".")
        if str.distance(from: str.endIndex, to: decPos!) == -2
        {
            strTip = sign+String(tip) + "0"
        }
        else{
           strTip = sign+String(tip)
        }
        if strTot.distance(from: strTot.endIndex, to: decPos2!) == -2
        {
            strTot = sign+strTot + "0"
        }
        else{
            strTot = sign+strTot
        }
        tipOutputLabel.text = strTip
        totalTipOutputLabel.text = strTot
    }
    @IBAction func tipValueChanged(_ sender: Any) {
        calcTip(tipPrecentagesBar)
    }
    
}
    

