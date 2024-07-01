//
//  AlmanacTests.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/18/24.
//

import XCTest
@testable import AdventOfCode

final class Day5AlmanacTests: XCTestCase {
 
    // start time: 4:44 -> 40 min
    // start time: 10:32 -> 34 min [finished v1]
    func testMapSeedToLocation() throws {
        var input = InputReader().returnInput("almanac")
        let almanac = Almanac()                
        
        XCTAssertEqual(almanac.buildLookUps(&input)[0], 51)
    }
}
