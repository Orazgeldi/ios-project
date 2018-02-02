//
//  model.swift
//  Calc
//
//  Created by Orazkeldi Zhamalbekov on 30.01.18.
//  Copyright © 2018 Orazkeldi Zhamalbekov. All rights reserved.
//

import Foundation
enum Operation {
    case constant (Double)
    case unaryOperation ((Double) -> Double)
    case binaryOperation((Double,Double ) -> Double)
    case equals
    case clear
}

func factarial(_ number : Double) -> Double {
    if floor(number) != number {
        return Double.infinity
    }
    var counter: Int64 = 1
    for i in 1...Int(number) {
        counter *= Int64(i)
    }
    return Double(counter)
}


struct CalcModel{
    private var label_operation: Double?
    private var operations: Dictionary<String,Operation> = [
        "𝝿": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "sin": Operation.unaryOperation(sin),
        "sin⁻¹":Operation.unaryOperation({1/sin($0)}),
        "cos": Operation.unaryOperation(cos),
        "cos⁻¹":Operation.unaryOperation({1/cos($0)}),
        "tan⁻¹":Operation.unaryOperation({1/tan($0)}),
        "sinh⁻¹":Operation.unaryOperation({1/sinh($0)}),
        "cosh⁻¹":Operation.unaryOperation({1/cosh($0)}),
        "tanh⁻¹":Operation.unaryOperation({1/tanh($0)}),
        "tan": Operation.unaryOperation(tan),
        "ln": Operation.unaryOperation(log),
        "log₂":Operation.unaryOperation({log(2)/log($0)}),
        
        "log": Operation.unaryOperation({ log( $0 ) / log(10)}),
        "log𝗒":Operation.binaryOperation({log($0) / log($1)}),
        
        "√x": Operation.unaryOperation(sqrt),
        "eˣ":Operation.unaryOperation({pow(M_E, $0)}),
        "yˣ": Operation.unaryOperation({pow(M_E, $0)}),
        "∜x": Operation.unaryOperation({pow($0,1/4)}),
        "∛x": Operation.unaryOperation({pow($0,1/3)}),
        "xⁿ": Operation.binaryOperation(pow),
        "sinh":Operation.unaryOperation(sinh),
        
        "cosh":Operation.unaryOperation(cosh),
        "tanh":Operation.unaryOperation(tanh),
        "x!":Operation.unaryOperation(factarial),


        "Rad": Operation.unaryOperation({$0*Double.pi / 180}),
//        "mc": Operation.binaryOperation(),
//        "m+": Operation.binaryOperation(),
//        "m-": Operation.binaryOperation(),
//        "mr": Operation.binaryOperation(),
        "EE": Operation.binaryOperation({$0*pow(10, $1)}),
        "%" : Operation.unaryOperation({$0/100}),
        "±" : Operation.unaryOperation(-),
        "x²" : Operation.unaryOperation({ pow($0,2)}),
        "x³" : Operation.unaryOperation({ pow($0,3)}),
        "x⁴":Operation.unaryOperation({pow($0,4)}),
        "2ˣ" : Operation.unaryOperation({ pow(2, $0)}),
        "10ˣ": Operation.unaryOperation({pow(10, $0)}),
        
        "1/x" : Operation.unaryOperation({1/$0}),
        "x": Operation.binaryOperation(*),
        "÷": Operation.binaryOperation(/),
        "+": Operation.binaryOperation(+),
        "-": Operation.binaryOperation(-),
        "=": Operation.equals,
        "C": Operation.clear
    ]
    mutating func preformOperation(_ operation: String){
        let symbol = operations[operation]!
        switch symbol {
        case .constant(let value):
            label_operation = value
        case .unaryOperation(let function):
            if label_operation != nil {
                label_operation = function(label_operation!)
            }
        case .binaryOperation(let function):
            if label_operation != nil {
                saving = SavingFirstOperandAndFunction (firstOperand: label_operation!, function: function )
            }
            break
    
        case .equals:
            if label_operation != nil{
                label_operation = saving?.performOperationWith(label_operation!)
            }
            break
        case .clear :
            label_operation = 0
            saving = nil
            break
        }
    }
    private var saving: SavingFirstOperandAndFunction?
    private  struct SavingFirstOperandAndFunction{
        let firstOperand: Double
        let function: ((Double, Double) -> Double)
        
        func performOperationWith( _ secondOperand: Double) -> Double{
            return function(firstOperand, secondOperand)
            
        }
    }
    mutating func setOperand(_ operand: Double){
        label_operation = operand
    }
    var result: Double?{
        get{
            return label_operation
        }
    }

}
