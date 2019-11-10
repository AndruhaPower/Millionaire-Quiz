//
//  GameSession.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 07/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class GameSession: Codable, CustomStringConvertible {
    
    var date: Date
    var score: Int
    var percent: Float
    
    var description: String {
        return ("score" + String(self.score) + "percent" + String(self.percent))
    }
    
    init(date: Date, score: Int, percent: Float) {
        self.date = date
        self.score = score
        self.percent = percent
    }
}
