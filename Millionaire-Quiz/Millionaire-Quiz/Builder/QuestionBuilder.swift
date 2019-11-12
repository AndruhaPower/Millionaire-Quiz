//
//  QuestionBuilder.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 13/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

final class QuestionBuilder {
    
    func build(questionsCount: Int, tableView: UITableView) -> [Question] {
        
        var addedQuestions = [Question]()
        
        for row in 0...questionsCount {
            
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
            
            if let questionText = cell?.questionTextField.text, !questionText.isEmpty,
                let answer1Text = cell?.answerOneTextField.text, !answer1Text.isEmpty,
                let answer2Text = cell?.answerTwoTextField.text, !answer2Text.isEmpty,
                let answer3Text = cell?.answerThreeTextField.text, !answer3Text.isEmpty,
                let answer4Text = cell?.answerFourTextField.text, !answer4Text.isEmpty,
                let correctAnswerNumber = cell?.correctAnswerSwitch.selectedSegmentIndex {
                    var correctAnswer: String {
                        switch correctAnswerNumber {
                        case 0:
                            return answer1Text
                        case 1:
                            return answer2Text
                        case 2:
                            return answer3Text
                        case 3:
                            return answer4Text
                        default:
                            return answer1Text
                        }
                    }
                
                    let question = Question(question: questionText
                        , answers: [answer1Text, answer2Text, answer3Text, answer4Text]
                        , correctAnswer: correctAnswer)
                    addedQuestions.append(question)
                }
        }
        return addedQuestions
    }
}
