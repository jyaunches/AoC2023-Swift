//
//  ScratchCardTests.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/18/24.
//

import XCTest
@testable import AdventOfCode

final class ScratchCardTests: XCTestCase {
    
    // Part 1: started 2:23 / v1 finished 3:00 / working: 3:07
    // total time: 44 min
    func testDetermineScratchCardPoints() throws {
        let input = InputReader().returnInput("scratch_cards")
        
        let game = ScratchCards()
        let points = game.getPoints(input: input)
        
        XCTAssertEqual(points, 15268)
    }
}
