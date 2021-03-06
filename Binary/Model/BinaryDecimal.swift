//
//  BinaryDecimal.swift
//  Binary
//
//  Created by Alan Ramos on 8/26/18.
//  Copyright © 2018 Alan Ramos. All rights reserved.
//

import Foundation

class BinaryDecimal {
    
    var bits: [Int]?
    var integer: Int?
    
    init(_ bits: [Int]) {
        self.bits = bits
    }
    
    init (_ decimal: Int) {
        self.integer = decimal
    }
    
    func calculateBinaryValueForInt() -> String {
        var newInt = integer!
        let rows = [128, 64, 32, 16, 8, 4, 2, 1]
        var binaryRows: [Int] = []
        for row in rows {
            let binaryDigit = oneOrZero(forValue: newInt, withBtiValue: row)
            binaryRows.append(binaryDigit)
            if binaryDigit == 1 {
                newInt = newInt - row
            }
        }
        let stringFronIntArray = binaryRows.map { String($0) }
        return stringFronIntArray.joined()
    }
    
    func calculateIntValueForBinary() -> String {
        var value = 0
        var multiplier = 1
        guard let bits = bits else {return "Error"}
        for bit in bits.reversed() {
            let newValue = bit * multiplier
            value = value + newValue
            multiplier = multiplier * 2
        }
        return String(value)
        
    }
        
    func oneOrZero(forValue value: Int, withBtiValue bitValue: Int) -> Int {
        if value - bitValue >= 0 {
            return 1
        } else {
            return 0
        }
        
    }
}
