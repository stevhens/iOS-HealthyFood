//
//  PlanWeightVC.swift
//  HealthyFood
//
//  Created by Stevhen on 08/04/20.
//  Copyright © 2020 Stevhen. All rights reserved.
//

import UIKit

class PlanWeightVC: UIViewController {
    
    @IBOutlet weak var currWeightLabel: UILabel!
    
    @IBOutlet weak var planKgLabel: UILabel!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var weightTargetTextField: UITextField!
    @IBOutlet weak var weightTargetOkBtn: UIButton!
    @IBOutlet weak var planNameLabel: UILabel!
    
    var weight: String!
    var height: String!
    var plan: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currWeightLabel.text = weight
        planNameLabel.text = plan
        weightTargetTextField.keyboardType = .asciiCapableNumberPad
        weightTargetTextField.underlined()
        getStartedBtn.layer.cornerRadius = 10
        weightTargetOkBtn.layer.cornerRadius = 10
        
//        let bmi = calcBMI(height: Double(height!)!, weight: Double(weight!)!)
    }
    
    @IBAction func weightTargetOkDidPressed(_ sender: Any) {
        let target = weightTargetTextField.text!
        let plans = ["Lose", "Maintain", "Gain"]
        var pos = -1
        var kg = 0.0
        
        if plan == "Lose Weight" {
            //show alert if weight < target
            kg = (Double(weight)! - Double(target)!) / 30.0
            pos = 0
        } else if plan == "Maintain Weight" {
            kg = 0.0
            pos = 1
        } else if plan == "Gain Weight" {
            kg = (Double(target)! - Double(weight)!) / 30.0
            pos = 2
        }
        
        let kgDecimal = String(format: "%.1f", kg)
        
        planKgLabel.text = "\(plans[pos]) \(kgDecimal) kg/day"
    }
    
    func calcBMI(height: Double, weight: Double) -> Double {
//        defaults.set(bmi, forKey: "bmi")
        let bmiValue = weight / pow(height, 2)
        return bmiValue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}