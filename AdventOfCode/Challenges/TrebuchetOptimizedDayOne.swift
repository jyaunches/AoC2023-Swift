//
//  PartOneCalibrationSum.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation
 
let digits: [String: Int] = Dictionary(uniqueKeysWithValues: (0..<10).map { (String($0), $0) })
let extendedDigits = digits.merging([
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
], uniquingKeysWith: { (_, new) in new })


class TrebuchetOptimizedDayOne {
    
    var library = ["one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
        
    // Optimized solution: 34 min to port from python
    func getSum(input: [String]) -> Int {
        var total = 0

            for line in input {
                let subset = extendedDigits.filter { line.contains($0.key) }
                                
                if subset.isEmpty {
                    continue
                }

                // Find the first occurrence position for min
                let x = subset.min { line.range(of: $0.key)!.lowerBound < line.range(of: $1.key)!.lowerBound }!.value

                // Find the last occurrence position for max
                let y = subset.max { line.range(of: $0.key, options: .backwards)!.lowerBound < line.range(of: $1.key, options: .backwards)!.lowerBound }!.value

                total += Int("\(x)\(y)")!
            }

            return total
    }

}
