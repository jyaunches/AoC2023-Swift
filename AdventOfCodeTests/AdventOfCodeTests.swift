//
//  AdventOfCodeTests.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/17/24.
//

import XCTest
@testable import AdventOfCode

final class AdventOfCodeTests: XCTestCase {

    // Part 1 - 34 minutes
    // Part 2 - 99 minutes
    func testCalibrationSum() throws {
        let input = InputReader().returnInput("input")
        
        let total = CalibrationSum().getSum(input: input)
        XCTAssertEqual(total, 54277)
    }
    
    // Part 1 - 48 minutes
    func testCubeGamePart1() throws {
        let cubeGame = CubeGame(config: GameConfiguration(red: 12, blue: 14, green: 13))
        
        let input = InputReader().returnInput("cube_game_input")
        let totalScore = cubeGame.findTheScore(input: input)
        
        XCTAssertEqual(totalScore, 3035)
    }
    
    // Part 2 - 16 minutes
    func testCubeGamePartTwo() throws {
        let cubeGame = CubeGame(config: GameConfiguration())
        
        let input = InputReader().returnInput("cube_game_input")
        let totalScore = cubeGame.powerTheMins(input: input)
        
        XCTAssertEqual(totalScore, 66027)
    }
    
    // Part 1 - started 10:36 (v1 finished 11:59) / Debug started: 12:00pm
    func testEngineSchematic() throws {
        let input = InputReader().returnInput("engine_schematic")
        
        let engineSchematic = EngineSchematic()
        engineSchematic.buildTree(input: input)
        
        XCTAssertEqual(engineSchematic.partTotals, 4361)
    }
    
    func testCanDetectSymbol() throws {
        
        let characters: [Character] = ["@", "a", "1", "$", "*"]

        for char in characters {
            if isSymbol(char) {
                print("\(char) is a symbol.")
            } else {
                print("\(char) is not a symbol.")
            }
        }
        
        var knownSymbols = CharacterSet(charactersIn: "`~!@#$%^&*()-_=+[{]}\\|;:/?><")
        
        var isSymbol = knownSymbols.contains("*")
        
        XCTAssertTrue(isSymbol)
    }
    
    func testNodeCanDetermineAdjacent() throws {
        let rootNode = PartNode(partNum: 411, xIndex: 14..<17, yIndex: 0)
        let notChildNode = PartNode(partNum: 429, xIndex: 3..<6, yIndex: 1)
        
        XCTAssertNil(rootNode.findAdjacent(potentialChildX: notChildNode.xIndex, y: notChildNode.yIndex))
        
        let childNode = SymbolNode(symbol: "\\", xIndex: 17..<18, yIndex: 1)
        
        XCTAssertNotNil(rootNode.findAdjacent(potentialChildX: childNode.xIndex, y: notChildNode.yIndex))
                                         
    }
    
    func testNodeCanDetermineAdjacentOnSameY() throws {
        let rootNode = PartNode(partNum: 411, xIndex: 14..<17, yIndex: 0)
        let symbolNode = SymbolNode(symbol: "*", xIndex: 17..<18, yIndex: 0)
                
        XCTAssertNotNil(rootNode.findAdjacent(potentialChildX: symbolNode.xIndex, y: symbolNode.yIndex))                                        
    }
    
    func testCanGetTotal() throws {
        let rootNode = PartNode(partNum: 411, xIndex: 14..<17, yIndex: 0)
        let midNode = SymbolNode(symbol: "*", xIndex: 14..<17, yIndex: 1)
        let childNode = PartNode(partNum: 35, xIndex: 3..<6, yIndex: 1)
        
        rootNode.children.append(midNode)
        midNode.children.append(childNode)
        
        XCTAssertEqual(rootNode.sumForTree, 446)
    }
    
    func isSymbol(_ character: Character) -> Bool {
        let symbolSet = CharacterSet.symbols
        return character.unicodeScalars.allSatisfy { symbolSet.contains($0) }
    }
    
}
