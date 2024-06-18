//
//  Part2CubeGame.swift
//  AdventOfCode
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation

struct GameConfiguration {
    var red: Int = 0
    var blue: Int = 0
    var green: Int = 0	
    
    func powerTheColors() -> Int {
        return red * blue * green
    }
}

struct GameResults {
    var id: Int
    var plays: [GameConfiguration]
}

class CubeGame {
    
    var config: GameConfiguration
    
    init(config: GameConfiguration) {
        self.config = config
    }
    
    func findTheScore(input: [String]) -> Int {
        var totalScore = 0
        parseGameLine(input: input).forEach( { totalScore += findLineScore(game: $0)})
        
        return totalScore
    }
    
    func powerTheMins(input: [String]) -> Int {
        var totalScore = 0
        parseGameLine(input: input).forEach( { totalScore += findLinePower(game: $0)})
        return totalScore
    }
    
    func findLinePower(game: GameResults) -> Int {
        var lineGameConfig = GameConfiguration()
        for play in game.plays {
            if play.blue > lineGameConfig.blue { lineGameConfig.blue = play.blue }
            if play.red > lineGameConfig.red { lineGameConfig.red = play.red }
            if play.green > lineGameConfig.green { lineGameConfig.green = play.green }
        }
        
        return lineGameConfig.powerTheColors()
    }
    
    func findLineScore(game: GameResults) -> Int {
        var impossiblePlay = false
        for play in game.plays {
            if play.blue > config.blue || play.red > config.red || play.green > config.green {
                impossiblePlay = true
            }
        }
        
        return impossiblePlay ? 0 : game.id
    }
    
    private func parseGameLine(input: [String]) -> [GameResults] {
        var results: [GameResults] = []
        
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
            
            results.append(GameResults(id: gameId, plays: gamePlays))
        }
        return results
    }
}
