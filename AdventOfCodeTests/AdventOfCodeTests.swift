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
        let input = CalibrationSumInput().returnInput("input")
        
        let total = CalibrationSum().getSum(input: input)
        XCTAssertEqual(total, 54277)
    }
    
    // started: 3:50pm
    // finished v1 of code: 4:38
    func testCubeGame() throws {
        let input = CalibrationSumInput().returnInput("cube_game_input")
        
        var totalScore = 0
        
        let gameConfig = GameConfiguration(red: 12, blue: 14, green: 13)
        
        let cubeGame = CubeGame(config: gameConfig)
        
        for (index, line) in input.enumerated() {
            
            let gameInput = line.split(whereSeparator: { $0 == ":"} )
            
            if gameInput.count < 2 { break }
            
            var gameId = 0
            if let idString = (gameInput[0].trimmingCharacters(in: .whitespacesAndNewlines).split(whereSeparator: { $0 == " "}).last.map { String($0) }) {
                gameId = Int(idString) ?? 0
            }
            if gameId == 0 { break }
            
            var gamePlays: [GameConfiguration] = []
            for play in gameInput[1].trimmingCharacters(in: .whitespacesAndNewlines).split(whereSeparator: { $0 == ";"}) {
                let singleDieConfigs = play.components(separatedBy: ",")
                
                var gameReveal = GameConfiguration()
                
                for config in singleDieConfigs {
                    let trimmedDieConfig = config.trimmingCharacters(in: .whitespacesAndNewlines)
                    let splitVals = trimmedDieConfig.split(separator: " ")
                    
                    if let foo = (splitVals.first.map { String($0) }),
                       let color = (splitVals.last.map { String($0) }),
                    let cubeAmount = Int(foo) {
                        
                        if color == "red" {
                            gameReveal.red = cubeAmount
                        }
                        if color == "blue" {
                            gameReveal.blue = cubeAmount
                        }
                        if color == "green" {
                            gameReveal.green = cubeAmount
                        }
                    }
                    
                                                        
                }
                gamePlays.append(gameReveal)
            }
            
            totalScore += cubeGame.findScore(game: GameResults(id: gameId, plays: gamePlays))
        }
        
        
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
