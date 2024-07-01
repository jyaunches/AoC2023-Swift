//
//  EngineSchematic.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation

class Node {
    var xIndex: Range<Int>
    var yIndex: Int
    
    var children: [Node] = []
    
    var sumForTree: Int {
        var sum: Int = 0
        
        children.forEach { child in
            sum += child.sumForTree            
        }
        
        if let partNode = self as? PartNode {
            return sum + partNode.partNum
        } else {
            return sum
        }
    }
    
    init(xIndex: Range<Int>, yIndex: Int) {
        self.xIndex = xIndex
        self.yIndex = yIndex
    }
    
    func findAdjacent(potentialChildX: Range<Int>, y: Int) -> Node? {
        let childUpperOverlap = potentialChildX.upperBound >= xIndex.lowerBound
        let childLowerOverlap = potentialChildX.lowerBound <= xIndex.upperBound
        let xOverlap = childUpperOverlap && childLowerOverlap
        
        if (y == yIndex+1) && xOverlap { return self } 
        if (y == yIndex) && xOverlap { return self }
        
        return children.first(where: { $0.findAdjacent(potentialChildX: potentialChildX, y: y) != nil })
    }
}

class PartNode: Node {
    var partNum: Int
    
    init(partNum: Int, xIndex: Range<Int>, yIndex: Int) {
        self.partNum = partNum
        super.init(xIndex: xIndex, yIndex: yIndex)
    }
}

class SymbolNode: Node {
    var symbol: Character
    
    init(symbol: Character, xIndex: Range<Int>, yIndex: Int) {
        self.symbol = symbol
        super.init(xIndex: xIndex, yIndex: yIndex)
    }
}


class EngineSchematic {
    var trees: [Node] = []
    var knownSymbols = CharacterSet(charactersIn: "`~!@#$%^&*()-_=+[{]}\\|;:/?><")
    
    var partTotals: Int {
        return trees.filter { $0.children.count > 0}.map { child in
            print("Child sum: \(child.sumForTree)")
            
            return child.sumForTree
        }.reduce(0, +)
    }
    
    func buildTree(input: [String]) {
        
        for (yIndex, line) in input.enumerated() {
            var evalWindow: String = ""
            
            for (xIndex, char) in line.enumerated() {
                if char.unicodeScalars.allSatisfy({ knownSymbols.contains($0) }) {
                    processPartEval(eval: evalWindow, x: xIndex, y: yIndex)
                    evalWindow = ""
                    let symbolNode = SymbolNode(symbol: char, xIndex: xIndex..<(xIndex+1), yIndex: yIndex)
                    appendOrCreate(symbolNode)
                } else if char == "." {
                    processPartEval(eval: evalWindow, x: xIndex, y: yIndex)
                    evalWindow = ""
                } else { // assume number
                    evalWindow.append(char)
                }
            }
        }
    }

    private func processPartEval(eval: String, x: Int, y: Int) {
        if let partNumber = Int(eval) {
            let xIndexRange = (x-eval.count)..<x
            let partNode = PartNode(partNum: partNumber, xIndex: xIndexRange, yIndex: y)
            appendOrCreate(partNode)
        }
    }
    
    private func appendOrCreate(_ node: Node) {
        var wasAdded = false
        
        trees.forEach { treeRoot in
            if let adjacentNode = treeRoot.findAdjacent(potentialChildX: node.xIndex, y: node.yIndex) {
                adjacentNode.children.append(node)
                wasAdded = true
                return
            }
        }
        
        if !wasAdded {
            trees.append(node)
        }
        
    }
}
