//
//  Game.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 07/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation


class Game: GameViewControllerDelegate {
    
    static let shared: Game = {
        let instance = Game()
        return instance
    }()
    
    private init() {
        self.records = self.recordCaretaker.retrieveRecords()
    }
    
    private let recordCaretaker = RecordCaretaker()
    
    var gameSession: GameSession?
    private(set) var records: [GameSession] {
        didSet {
            self.recordCaretaker.save(records: self.records)
        }
    }
    
    func didEndGameWithResult(result: Int, date: Date, percent: Float) {
        self.gameSession = GameSession(date: date, score: result, percent: percent)
        guard let gameSession = self.gameSession else { return }
        Game.shared.records.append(gameSession)
        
        self.gameSession = nil 
    }
}
