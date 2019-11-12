//
//  GameViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 06/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import Foundation

protocol GameViewControllerDelegate {
    func didEndGameWithResult(result: Int, date: Date, percent: Float)
}

class GameViewController: UIViewController {
    
    var infoline: String = ""
    var percent: Observable<Float> {
        let floatCount: Float = Float(self.correctAnswers.value)
        return Observable<Float>( floatCount.rounded() / Float(self.totalQuestions).rounded() * 100)
    }
    var difficulty: Difficulty
    let totalQuestions: Int = QuestionData.questions.count
    var gameDelegate: GameViewControllerDelegate = Game.shared
    let operationQueue = OperationQueue()
    var correctAnswers = Observable<Int>(0)
    let backGroundImageURL: String = "https://wallpaperbro.com/img/570735.jpg"
    var customView = CustomGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var questionStrategy: QuestionStrategy {
        switch difficulty {
        case .straightForward:
            return StraightForwardQuestionStrategy()
        case .allRandom:
            return RandomQuestionsStrategy()
        }
    }
    
    var questions = [Question]()
    
    @objc private func checkAnswer(sender: CustomAnswerButton) {
        
        guard let currentQuestion = self.questions.first(where: { qst -> Bool in
            return qst.question == self.customView.questionLabel.text
        }) else { self.saveAndQuit() ; return}
        if sender.currentTitle == currentQuestion.correctAnswer {
            self.questions.removeAll { qst -> Bool in
                return qst.question == self.customView.questionLabel.text
            }
            self.correctAnswers.value += 1
            self.changeQuestion()
        } else {
            sender.backgroundColor = .red
            guard self.correctAnswers.value > 0 else {
                self.saveAndQuit()
                return
            }
            self.saveAndQuit()
        }
    }
    
    private func changeQuestion() {
        guard let qst = questions.randomElement() else { self.dismiss(animated: true); return}
        self.configureQuestion(question: qst)
    }
    
    func getImage(url: String, completion: @escaping (UIImage)->()) {
        let operation = LoadImageOperation()
        operation.url = URL(string: url)
        self.operationQueue.addOperation(operation)
        operation.completion = { image in
            completion(image)
        }
    }
    
    private func saveAndQuit() {
        guard self.correctAnswers.value > 0 else {
            self.gameDelegate.didEndGameWithResult(result: self.correctAnswers.value, date: Date(), percent: self.percent.value)
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.gameDelegate.didEndGameWithResult(result: self.correctAnswers.value, date: Date(), percent: self.percent.value)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureView() {
        
        self.percent.addObserver(self, options: [.new, .initial]) { [weak self] (percent, _) in
            self?.customView.infoLabel.text = "Текущий результат: отгадано \(Int(self!.correctAnswers.value)) из \(QuestionData.questions.count) - \(percent)%"
        }
        self.correctAnswers.addObserver(self, options: [.new, .initial]) { [weak self] (correct, _) in
            self?.customView.infoLabel.text = "Текущий результат: отгадано \(correct)) из \(QuestionData.questions.count) - \(self!.percent.value)%"
        }
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            self.customView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.getImage(url: self.backGroundImageURL) { image in
            self.customView.backgroundImage.image = image
        }
        self.view.backgroundColor = .systemIndigo
        self.configureButtons()
        self.questions = questionStrategy.createArray(questions: QuestionData.getAllQuestions())
        self.configureQuestion(question: self.questions[0])
        self.customView.infoLabel.text = "Текущий результат: отгадано \(self.correctAnswers.value) из \(QuestionData.questions.count) - \(self.percent.value)%"
    }
    
    private func configureQuestion(question: Question) {
        self.customView.answerOneButton.setTitle(question.answers[0], for: .normal)
        self.customView.answerTwoButton.setTitle(question.answers[1], for: .normal)
        self.customView.answerThreeButton.setTitle(question.answers[2], for: .normal)
        self.customView.answerFourButton.setTitle(question.answers[3], for: .normal)
        self.customView.questionLabel.text = question.question
        self.customView.answerOneButton.backgroundColor = .black
        self.customView.answerTwoButton.backgroundColor = .black
        self.customView.answerThreeButton.backgroundColor = .black
        self.customView.answerFourButton.backgroundColor = .black
    }
    
    private func configureButtons() {
        let one = self.customView.answerOneButton
        let two = self.customView.answerTwoButton
        let three = self.customView.answerThreeButton
        let four = self.customView.answerFourButton
        
        one.addTarget(self, action: #selector(checkAnswer(sender:)), for: .touchUpInside)
        two.addTarget(self, action: #selector(checkAnswer(sender:)), for: .touchUpInside)
        three.addTarget(self, action: #selector(checkAnswer(sender:)), for: .touchUpInside)
        four.addTarget(self, action: #selector(checkAnswer(sender:)), for: .touchUpInside)
    }
}
