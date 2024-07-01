//
//  TestsDay1.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/30/24.
//

import XCTest
@testable import AdventOfCode

final class Day1TrebuchetTests: XCTestCase {

    // Part 1 - 34 minutes
    // Part 2 - 99 minutes
    func testCalibrationSum() throws {
        let input = InputReader().returnInput("trebuchet")
        
        let total = TrebuchetDayOne().getSum(input: input)
        XCTAssertEqual(total, 54277)
    }
    
    func testCalibrationSumOptimizedCode() throws {
        let input = InputReader().returnInput("trebuchet")
        
        let total = TrebuchetOptimizedDayOne().getSum(input: input)
        XCTAssertEqual(total, 54277)
    }
}
