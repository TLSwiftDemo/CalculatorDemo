//
//  CalculatorBrain.swift
//  CalculatrDemo
//
//  Created by Andrew on 16/7/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
func mutiply(op1:Double,op2:Double)->Double{
    
    return op1*op2
}


class CalculatorBrain: NSObject {
    
    var accumlator:Double = 0
    
    var operations:Dictionary<String,Operation> = [
        "𝞹":Operation.Constant(M_PI),
        "e":Operation.Constant(M_E),
        "±":Operation.UnaryOperation({ -$0 }),
        "√":Operation.UnaryOperation(sqrt),
        "sin":Operation.UnaryOperation(sin),
        "cos":Operation.UnaryOperation(cos),
        "×":Operation.BinaryOperation({$0 * $1}),
        "−":Operation.BinaryOperation({$0 - $1}),
        "+":Operation.BinaryOperation({$0 + $1}),
        "÷":Operation.BinaryOperation({$0 / $1}),
        "=":Operation.Equals ]
    
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
                accumlator=function(accumlator)
            case .BinaryOperation(let foo):
                executePedingOperation()
                pending = PedingBinaryOperationInfo(binaryFunction: foo, firstOperand: accumlator)
                print("pending.firstOperand:\(pending?.firstOperand)")
            case .Equals:
               executePedingOperation()
            }
        }
    }
    
    func executePedingOperation() -> Void {
        if pending != nil{
            accumlator = pending!.binaryFunction(pending!.firstOperand, accumlator)
        }
    }
    
     var pending:PedingBinaryOperationInfo?
    
    struct PedingBinaryOperationInfo {
        /// 声明一个函数
        var binaryFunction : (Double,Double)->Double
        var firstOperand:Double
    }
    
    
    var result:Double{
        get{
          return accumlator
        }
    }
    
}



