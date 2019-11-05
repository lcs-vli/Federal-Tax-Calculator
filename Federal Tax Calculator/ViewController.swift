//
//  ViewController.swift
//  Federal Tax Calculator
//
//  Created by Li, Muchen on 2019-10-31.
//  Copyright © 2019 Li, Muchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties (Outlets)(constants)
    @IBOutlet weak var annualIncome: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var taxRate: UILabel!
    @IBOutlet weak var taxOwing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setp after loading the view.
    }
    
    
    @IBAction func calculateTaxOwingAndTaxRate(_ sender: Any) {
        reset()
        calculate()
    }
    
    func calculate(){
        
        //get user input
        guard let userName = name.text else {
            taxOwing.text = "Please enter your first name"
            return
        }
        guard let annualIncomeText = annualIncome.text else {
            taxOwing.text = "Please enter your annual income in dollars"
            return
        }
                              
        //convert value into double
        guard let Income = Double(annualIncomeText) else {
            taxOwing.text = "Please enter your annual income in dollars"
            return
        }
    
        //calculate tax owing and tax rate
        switch Income{
        case 0...47630:
            let owingInt = Int(0.15 * Income * 100)
            let owing = Double(owingInt)/100
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(userName) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 47631...95259:
            let owingInt = Int(0.15 * 47630 + 0.205*(Income - 47630)*100)
            let owing = Double(owingInt)/100
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(userName) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 95260...147667:
            let owingInt = Int(0.15 * 47630 + 0.205 * 47629 + 0.26 * (Income - 95259)*100)
            let owing = Double(owingInt)/100
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(userName) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 147668...210371:
            let owingInt = Int(0.15 * 47630 + 0.205 * 47629 + 0.26 * 52408 + 0.29 * (Income-147667)*100)
            let owing = Double(owingInt)/100
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(userName) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        default:
            let owingInt = Int(0.15*47630 + 0.205*47629 + 0.26*52408 + 0.29*62704 + 0.33*(Income-210371)*100)
            let owing = Double(owingInt)/100
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(userName) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        }
     }
    
    // reSet the text
    func reset(){
        taxRate.text = ""
        taxOwing.text = ""
    }

}
