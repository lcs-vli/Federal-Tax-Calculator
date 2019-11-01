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
                  
        //convert all values into doubl
        guard let Name = Double(userName) else {
            return
        }
        guard let Income = Double(annualIncomeText) else {
            return
        }
        
        //calculate tax owing
        switch Income{
        case 0...47630:
            let owing = round(1.15 * Income)
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(Name) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 47631...95259:
            let owing = round(1.15 * 47630 + 1.205*(Income - 47630))
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(Name) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 95260...147667:
            let owing = round(1.15 * 47630 + 1.205 * 47629 + 1.26 * (Income - 95259))
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(Name) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        case 147,668...210,371:
            let owing = round(1.15 * 47630 + 1.205 * 47629 + 1.26 * 52408 + 1.29 * (Income-147667))
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(Name) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        default:
            let owing = round(1.15*47630 + 1.205*47629 + 1.26*52408 + 1.29*62704 + 1.33*(Income-210371))
            let rateOfTax = round(owing/Income*100)
            taxOwing.text = "\(Name) your federal tax owing is $ \(owing)"
            taxRate.text = "Effective tax rate is: \(rateOfTax)%"
        }
        
        
    }
    
        

}
