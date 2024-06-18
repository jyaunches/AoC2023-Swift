//
//  ScratchCards.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/18/24.
//

import Foundation

extension String {
    func allInts() -> [Int] {
        self.split(separator: " ").compactMap( { Int($0) } )
    }
    
    var isEmpty: Bool {
        return self == ""
    }
}

class Score {
    var total = 0
    
    func increment() {
        if total == 0 {
            total = 1
        } else {
            total = total + total
        }
    }
}

struct Card {
    
    var score = Score()
    
    init(line: String) {
        if !line.isEmpty {
            let lineParts = line.components(separatedBy: ":")
            let nums = lineParts[1].components(separatedBy: "|")
            let winners = Set(nums[0].allInts())
            let card = Set(nums[1].allInts())
            
            let matches = winners.intersection(card)
            
            for _ in 0..<matches.count {
                score.increment()
            }
        }        
    }
}

class ScratchCards {
    
    // Questions: are there duplicates in either side? -> Assume possible.
    
    func getPoints(input: [String]) -> Int {        
        return input.map { Card(line: $0) }.reduce(0, { $0 + $1.score.total })
    }
}
