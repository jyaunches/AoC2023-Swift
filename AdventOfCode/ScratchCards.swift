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

class Card {
    
    var score = Score()
    var matches: Int = 0
    var cardId: Int = 0
    var count: Int = 1
    
    init(line: String) {
        if !line.isEmpty {
            let lineParts = line.components(separatedBy: ":")
            
            cardId = Int(lineParts[0].components(separatedBy: " ").last ?? "") ?? 0
            
            let nums = lineParts[1].components(separatedBy: "|")
            let winners = Set(nums[0].allInts())
            let card = Set(nums[1].allInts())
            
            matches = winners.intersection(card).count
            
            for _ in 0..<matches {
                score.increment()
            }
        }        
    }
    
    func incrementCount() {
        self.count += 1
    }
}

class ScratchCards {
    
    // Questions: are there duplicates in either side? -> Assume possible.
    
    func getPoints(input: [String]) -> Int {
        return input.filter { !$0.isEmpty }.map { Card(line: $0) }.reduce(0, { $0 + $1.score.total })
    }
    
    // started: 3:40
    func buildWinningCardCopies(input: [String]) -> Int {
        let cards = input.filter { !$0.isEmpty }.map { Card(line: $0) }
        
        for (index, card) in cards.enumerated() {
            
            let copyRange: Range<Int> = (index+1)..<(index+1 + card.matches)
            cards[copyRange].forEach( { $0.count += card.count })
        }
        
        return cards.reduce(0, { $0 + $1.count } )
    }
}
