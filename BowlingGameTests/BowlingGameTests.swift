//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Yemi Ajibola on 8/18/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {
    var game: BowlingGame!
    
    override func setUp() {
        super.setUp()
        game = BowlingGame()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
    
    private func rollStrike() {
        game.roll(10)
    }
    
    func testGutterGame() {
        rollMany(0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        rollMany(1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(3)
        
        rollMany(0, times: 17)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(0, times: 16)
        
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        rollMany(10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
    
}
