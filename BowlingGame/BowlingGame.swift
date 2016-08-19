//
//  BowlingGame.swift
//  BowlingGame
//
//  Created by Yemi Ajibola on 8/18/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

import Foundation

class BowlingGame {
    
    private var rolls = [Int](count: 21, repeatedValue: 0)
    private var currentRoll = 0
    
    func roll(pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var score = 0
        var frameIndex = 0
        
        for _ in 1...10 {
            if isStrike(frameIndex) {
                score += 10 + strikeBonus(frameIndex)
                frameIndex += 1
            } else if isSpare(frameIndex) {
                score += 10 + spareBonus(frameIndex)
                frameIndex += 2
            } else {
                score += sumOfBallsInFrame(frameIndex)
                frameIndex += 2
            }
        }
        
        return score
    }
    
    private func isStrike(frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
    
    private func isSpare(frameIndex: Int) -> Bool {
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
    
    private func strikeBonus(frameIndex: Int) -> Int{
        return rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    private func spareBonus(frameIndex: Int) -> Int{
        return rolls[frameIndex + 2]
    }
    
    private func sumOfBallsInFrame(frameIndex: Int) -> Int {
        return rolls[frameIndex] + rolls[frameIndex + 1]
    }
}