//
//  ScratchCardTests.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/18/24.
//

import XCTest
@testable import AdventOfCode

final class ScratchCardTests: XCTestCase {
    
    // total time: 44 min
    func testDetermineScratchCardPoints() throws {
        let input = InputReader().returnInput("scratch_cards")
        
        let game = ScratchCards()
        let points = game.getPoints(input: input)
        
        XCTAssertEqual(points, 15268)
    }
    
    // total time: 41 min
    func testCountWinningCardCopies () throws {
        let input = InputReader().returnInput("scratch_cards")
        
        let game = ScratchCards()
        let cards = game.buildWinningCardCopies(input: input)
        
        XCTAssertEqual(cards, 6283755)
    }
}
