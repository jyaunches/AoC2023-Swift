//
//  AdventOfCodeTests.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/17/24.
//

import XCTest
@testable import AdventOfCode

final class AdventOfCodeTests: XCTestCase {

    
    
    func testCalibrationSum() throws {
        let input = InputReader().returnInput("input")
        
        let total = CalibrationSum().getSum(input: input)
        XCTAssertEqual(total, 54277)
    }
    
    // started: 3:50pm
    // finished v1 of code: 4:38
    func testCubeGame() throws {
        let gameConfig = GameConfiguration(red: 12, blue: 14, green: 13)
        let cubeGame = CubeGame(config: gameConfig)
        
        let input = InputReader().returnInput("cube_game_input")
        let totalScore = cubeGame.parseInput(input: input)
        
        XCTAssertEqual(totalScore, 3035)
    }
    
    func splitStringAndGetFirstElement(_ input: String, separator: Character) -> String? {
        let components = input.split(separator: separator)
        return components.first.map { String($0) }
    }
    
    // started: 1:19pm / completed: 2:58
    func testCalibrationSumWithNumberWords () throws {
        
    }
}
