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
    
}
