//
//  CreateQuestionViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {
    
    var customView = CreateQuestionCustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
        self.setupView()
    }
    
    var correctAnswer: String {
        switch self.customView.correctAnswerSwitch.selectedSegmentIndex {
        case 0:
            return self.customView.answerOneTextField.text ?? "Correct Answer 1 Is not recieved"
        case 1:
            return self.customView.answerTwoTextField.text ?? "Correct Answer 2 Is not recieved"
        case 2:
            return self.customView.answerThreeTexField.text ?? "Correct Answer 3 Is not recieved"
        case 3:
            return self.customView.answerFourTextField.text ?? "Correct Answer 4 Is not recieved"
        default:
            return "Default Block"
        }
    }
    
    private func setupView() {
        
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            self.customView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.customView.saveQuestion.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        guard let question = self.customView.questionTextField.text,
            let answerOne = self.customView.answerOneTextField.text,
            let answerTwo = self.customView.answerTwoTextField.text,
            let answerThree = self.customView.answerThreeTexField.text,
            let answerFour = self.customView.answerFourTextField.text
            else { print("Не все поля заполнены"); return }
        
        let addedQuestion: Question = Question(question: question
                                            , answers: [answerOne,
                                                         answerTwo,
                                                         answerThree,
                                                         answerFour]
                                            , correctAnswer: self.correctAnswer)
        
        QuestionData.questions.append(addedQuestion)
        self.customView.answerOneTextField.text = ""
        self.customView.answerTwoTextField.text = ""
        self.customView.answerThreeTexField.text = ""
        self.customView.answerFourTextField.text = ""
    }
}
