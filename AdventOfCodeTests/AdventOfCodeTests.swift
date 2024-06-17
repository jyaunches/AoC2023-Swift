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
        let input = CalibrationSumInput().returnInput()
        
        let total = CalibrationSum().getSum(input: input)
        XCTAssertEqual(total, 54390)
    }
    
    // started: 1:19pm / completed: 2:58
    func testCalibrationSumWithNumberWords () throws {
        
    }
}
