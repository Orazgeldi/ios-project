//
//  ViewController.swift
//  Calc
//
//  Created by Orazkeldi Zhamalbekov on 29.01.18.
//  Copyright © 2018 Orazkeldi Zhamalbekov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myDisplay: UILabel!
    private var typing : Bool = false
    private var austru = Austru()
    @IBAction func ndAustru(_ sender: Any) {
        let list = austru.getState
        for i in 0...9 {
            let button = (view.viewWithTag(i+10) as? UIButton)!
            button.setTitle(list[i], for: UIControlState.normal)
        }
    }
    @IBAction func number(_ sender: UIButton) {
        if typing{
            let current_display = myDisplay.text!
            let current_title_of_button = sender.currentTitle!
            myDisplay.text = current_display + current_title_of_button
        }else{
            myDisplay.text = sender.currentTitle!
            typing = true
        }
    }
    var displayValue: Double{
        get{
            var result = Double(myDisplay.text!)!
         if myDisplay.text! == "Error" {
                result = Double.infinity
            }
            return result
        }
        set{
            if newValue == Double.infinity{
                myDisplay.text = "Error"
                
            }else{
                myDisplay.text = String(newValue)
            }
        }
    }
    
    
    private var mymodel = CalcModel()
    
    
    @IBAction func operation(_ sender: UIButton) {
        if typing{
            mymodel.setOperand(displayValue)
            typing = false
        }
        mymodel.preformOperation(sender.currentTitle!)
        if let result = mymodel.result{
            displayValue = result
        }
    }
}

