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
    
    func findScore(game: GameResults) -> Int {
        
        var impossiblePlay = false
        for play in game.plays {
            if play.blue > config.blue || play.red > config.red || play.green > config.green {
                impossiblePlay = true
            }
        }
        
        return impossiblePlay ? 0 : game.id
    }
}
