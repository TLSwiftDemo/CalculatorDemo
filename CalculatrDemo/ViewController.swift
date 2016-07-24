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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    @IBAction func numberBtnClick(sender: UIButton) {
        
        showLb.text = sender.currentTitle
    }
 

    @IBAction func clearAction(sender: UIButton) {
        showLb.text = ""
    }

}

