//
//  CalculatorBrain.swift
//  CalculatrDemo
//
//  Created by Andrew on 16/7/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
func mutiply(op1:Double,op2:Double)->Double{
    
    return 10
}


class CalculatorBrain: NSObject {
   
        var accumlator:Double = 0
        
        var operations:Dictionary<String,Operation> = [
            "1":Operation.Constant(M_PI),
            "2":Operation.Constant(M_E),
            "3":Operation.UnaryOperation(sqrt),
            "cos":Operation.UnaryOperation(cos),
            "x":Operation.BinaryOperation(mutiply)]
        
        enum Operation {
            case Constant(Double)
            case UnaryOperation((Double)->Double)
            case BinaryOperation((Double,Double)->Double)
            case Equals
        }
        
        
        func perfromOperation(symbol:String) -> Void {
            if let operation = operations[symbol]{
                switch operation {
                case .Constant(let value):
                    accumlator = value
                case .UnaryOperation(let function):
                    function(accumlator)
                default:
                    break
                }
            }
        }
        
        
    }
    


