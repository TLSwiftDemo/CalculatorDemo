//
//  ViewController.swift
//  CalculatrDemo
//
//  Created by Andrew on 16/7/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showLb: UILabel!
    
    var brain:CalculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    @IBAction func numberBtnClick(sender: UIButton) {
        
        showLb.text = sender.currentTitle
        brain.accumlator = Double(showLb.text!)!
    }
 

    @IBAction func clearAction(sender: UIButton) {
        showLb.text = ""
        brain.accumlator = 0
        brain.pending = nil
    }

    /**
     计算结果
     
     - parameter sender: <#sender description#>
     */
    @IBAction func caculatorAction(sender: UIButton) {
       
        brain.perfromOperation(sender.currentTitle!)
        
        let result = brain.result
        
        showLb.text = String(result)
    }
}









