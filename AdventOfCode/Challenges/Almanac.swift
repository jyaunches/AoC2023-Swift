//
//  almanac.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/18/24.
//

import Foundation

struct ShiftGuide {
    var source: Int
    var destination: Int
    var shift: Int
    
    func sourceNumberPresent(_ source: Int) -> Bool {
        return (self.source < source) && (source < self.source + shift)
    }
    
    func shiftedDestination(_ source: Int) -> Int? {
        if sourceNumberPresent(source) {
            let calculatedShift = source - self.source
            return destination + calculatedShift
        }
        return nil
    }
}

struct ConversionMap {
    var name: String
    var guides: [ShiftGuide] = []
    
    func mapDestination(source: Int) -> Int {
        if let guide = guides.first(where: { $0.sourceNumberPresent(source) } ) {
            return guide.shiftedDestination(source) ?? source
        }
        return source
    }
}

class Almanac {
    
    
    init() {
        
    }
    
    func buildLookUps(_ input: inout [String]) -> [Int] {
        // parse seed line, put seeds in array
        
        // when encountering a line that ends in 'map:'
        // parse subsequent lines and modify the dictionary
        
        let seeds = input.removeFirst().components(separatedBy: ":")[1].components(separatedBy: " ").map( { Int($0) } )
        
        var conversionMaps: [ConversionMap] = []
        var currentMap: ConversionMap?
        for line in input {
            if line.last == ":" {
                let name = line.components(separatedBy: " ")[0]
                currentMap = ConversionMap(name: name)
            } else if line == "",
                let currentMap = currentMap {
                conversionMaps.append(currentMap)
            } else {
                let lineItems = line.components(separatedBy: " ")
                
                if let destinationIndex = Int(lineItems[0]),
                   let sourceIndex = Int(lineItems[1]),
                   let rangeLength = Int(lineItems[2]) {
                    
                    let shiftGuide = ShiftGuide(source: sourceIndex, destination: destinationIndex, shift: rangeLength)
                    currentMap?.guides.append(shiftGuide)
                }
            }
        }
        
        return seeds.compactMap( { $0 }).map({ seed in
            conversionMaps.reduce(seed, { $1.mapDestination(source: $0)})
        })
    }
    
}
