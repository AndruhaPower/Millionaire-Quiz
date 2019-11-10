//
//  ChangeQuestionStrategy.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

protocol QuestionStrategy {
    func createArray(questions: [Question]) -> [Question]
}

final class RandomQuestionsStrategy: QuestionStrategy {
    
    func createArray(questions: [Question]) -> [Question] {
        var shuffledQuestions = questions
        shuffledQuestions.shuffle()
        return shuffledQuestions
    }
}
