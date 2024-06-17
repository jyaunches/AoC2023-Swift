//
//  PartOneCalibrationSum.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation

class CalibrationSum {
    
    // assumptions:
    // * you must have at least 1 digit on each line
    // * if you only have 1 number on a line, it is used for the first and last chars
    // time to completion: 34 minutes
    func getSum(input: [String]) -> Int {
        var total: Int = 0
        
        for line in input {
            var firstChar: String? = nil
            var lastChar: String? = nil
            
            for (index, char) in line.enumerated() {
                if var charAsInt = char.wholeNumberValue {
                    if firstChar == nil {
                        firstChar = "\(charAsInt)"
                    }
                    lastChar = "\(charAsInt)"                    
                }
            }
            
            if let firstChar = firstChar,
               let lastChar = lastChar,
               let calibrationValue = Int("\(firstChar)\(lastChar)") {
                total += calibrationValue
            } 
        }
        return total
    }
   
}
