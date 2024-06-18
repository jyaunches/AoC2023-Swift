//
//  ScratchCards.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/18/24.
//

import Foundation

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

class ScratchCards {
    
    // Questions: are there duplicates in either side? -> Assume possible. If not, we could potentially sort both lists together.
    
    func getPoints(input: [String]) -> Int {
        
        var totalScore = 0
        for (index, line) in input.enumerated() {
            
            let gameInput = line.split(whereSeparator: { $0 == ":"} )
            
            if gameInput.count < 2 { break }
            
            let inputArrays = gameInput[1].split(whereSeparator: { $0 == "|" })
            
            let cardNumbersString = inputArrays[1].trimmingCharacters(in: .whitespacesAndNewlines)
            let winningNumbersString = inputArrays[0].trimmingCharacters(in: .whitespacesAndNewlines)
            
            var cardNumbers = cardNumbersString.split(whereSeparator: { $0 == " " }).map( { Int($0) ?? 0 })
            cardNumbers.sort()
            
            var winningNumbers = winningNumbersString.split(whereSeparator: { $0 == " " }).map( { Int($0) ?? 0 })
            winningNumbers.sort()
            
            var cardPointer = 0
            var winningPointer = 0
            
            let score = Score()
            
            while cardPointer < cardNumbers.count && winningPointer < winningNumbers.count {
                let cardVal = cardNumbers[cardPointer]
                let winVal = winningNumbers[winningPointer]
                
                if cardVal == winVal {
                    score.increment()
                    cardPointer += 1
                } else if cardVal < winVal {
                    cardPointer += 1
                } else {
                    winningPointer += 1
                }
            }
            totalScore += score.total
        }
        return totalScore
    }
        
        func mergeSort(_ array: [Int]) -> [Int] {
            guard array.count > 1 else { return array }
            
            let midIndex = array.count / 2
            
            let lowerHalf = mergeSort(Array(array[0..<midIndex]))
            let topHalf = mergeSort(Array(array[midIndex..<array.count]))
            
            return merge(lowerHalf, topHalf)
        }
        
        func merge(_ left: [Int], _ right: [Int]) -> [Int] {
            var leftIndex = 0
            var rightIndex = 0
            var orderedArray = [Int]()
                        
            while leftIndex < left.count && rightIndex < right.count {
                    if left[leftIndex] < right[rightIndex] {
                        orderedArray.append(left[leftIndex])
                        leftIndex += 1
                    } else {
                        orderedArray.append(right[rightIndex])
                        rightIndex += 1
                    }
                }

                while leftIndex < left.count {
                    orderedArray.append(left[leftIndex])
                    leftIndex += 1
                }

                while rightIndex < right.count {
                    orderedArray.append(right[rightIndex])
                    rightIndex += 1
                }

                return orderedArray
        }
}
