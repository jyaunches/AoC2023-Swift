//
//  PartOneCalibrationSum.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation
 
class LineValues {
    var firstChar: String? = nil
    var lastChar: String? = nil
    
    func assignFirstAndLast(value: Int) {
        if firstChar == nil {
            firstChar = "\(value)"
        }
        lastChar = "\(value)"
    }
    
    func assignFrom(_ other: LineValues) {
        if firstChar == nil {
            firstChar = other.firstChar
        }
        lastChar = other.lastChar
    }
    
    var calibrationValue: Int? {
        if let firstChar = firstChar,
           let lastChar = lastChar {
           return Int("\(firstChar)\(lastChar)")
        }
        return nil
    }
}

class TrebuchetDayOne {
    
    var library = ["one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
        
    
    // assumptions:
    // * you must have at least 1 digit on each line
    // * if you only have 1 number on a line, it is used for the first and last chars
    // time to completion: 34 minutes
    func getSum(input: [String]) -> Int {
        var total: Int = 0
        
        for line in input {
            var lineValues = LineValues()
            parseLine(line: line, lineValues: lineValues)
            
            if let calibrationValue = lineValues.calibrationValue {
                total += calibrationValue
            }
        }
        return total
    }
    
    func parseLine(line: String, lineValues: LineValues) {
        var evalString = ""
        
        for (index, char) in line.enumerated() {
            evalString.append(char)
            
            if let actualValue = library[evalString] {
                lineValues.assignFirstAndLast(value: actualValue)
            } else if let charAsInt = char.wholeNumberValue {
                lineValues.assignFirstAndLast(value: charAsInt)
            } else if evalString.count >= 3,
                let foundValue = examineWindow(evalString){
                lineValues.assignFrom(foundValue)
            }
        }
    }
    
    func examineWindow(_ eval: String) -> LineValues? {
        
        var lv: LineValues? = nil
        for index in 0...(eval.count-3) {
            let startIndex = eval.index(eval.startIndex, offsetBy: index)
            let substring = eval.substring(from: startIndex)
            
            if let foundValue = library[substring] {
                lv = LineValues()
                lv?.assignFirstAndLast(value: foundValue)
            }
        }
        return lv
    }

}
