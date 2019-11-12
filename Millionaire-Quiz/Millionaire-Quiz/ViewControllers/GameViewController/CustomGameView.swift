//
//  CustomGameView.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 06/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CustomGameView: UIView {
    
    var infoLabel = UILabel()
    var backgroundQuestionView = UIView()
    var questionLabel = UILabel()
    var answerOneButton = CustomAnswerButton()
    var answerTwoButton = CustomAnswerButton()
    var answerThreeButton = CustomAnswerButton()
    var answerFourButton = CustomAnswerButton()
    var backgroundImage = UIImageView()
    private let buttonWidth: CGFloat = 200
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        self.infoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.infoLabel)
        
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            self.infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.infoLabel.widthAnchor.constraint(equalToConstant: 400),
            self.infoLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.infoLabel.backgroundColor = .black
        self.infoLabel.alpha = 0.4
        self.infoLabel.font = UIFont(name: "GillSans-Bold", size: 15)
        self.infoLabel.textColor = .white
        self.infoLabel.textAlignment = .center
        
        self.backgroundQuestionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundQuestionView)
        
        NSLayoutConstraint.activate([
            self.backgroundQuestionView.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor, constant: 20),
            self.backgroundQuestionView.widthAnchor.constraint(equalToConstant: 400),
            self.backgroundQuestionView.heightAnchor.constraint(equalToConstant: 300),
            self.backgroundQuestionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundQuestionView.addSubview(self.backgroundImage)
        
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.backgroundQuestionView.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.backgroundQuestionView.bottomAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.backgroundQuestionView.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.backgroundQuestionView.trailingAnchor)
        ])
        
        self.questionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundImage.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            self.questionLabel.centerXAnchor.constraint(equalTo: self.backgroundImage.centerXAnchor),
            self.questionLabel.centerYAnchor.constraint(equalTo:
                self.backgroundImage.centerYAnchor),
            self.questionLabel.widthAnchor.constraint(equalToConstant: 250)
            
        ])
        
        self.configureLabel()
        
        self.answerOneButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.answerOneButton)
        
        NSLayoutConstraint.activate([
            self.answerOneButton.topAnchor.constraint(equalTo: self.backgroundQuestionView.bottomAnchor, constant: 75),
            self.answerOneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.5),
            self.answerOneButton.widthAnchor.constraint(equalToConstant: self.buttonWidth),
            self.answerOneButton.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        self.answerTwoButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.answerTwoButton)
        
        NSLayoutConstraint.activate([
            self.answerTwoButton.leadingAnchor.constraint(equalTo: self.answerOneButton.trailingAnchor, constant: 10),
            self.answerTwoButton.topAnchor.constraint(equalTo: self.backgroundQuestionView.bottomAnchor, constant: 75),
            self.answerTwoButton.widthAnchor.constraint(equalToConstant: self.buttonWidth),
            self.answerTwoButton.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        self.answerThreeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.answerThreeButton)
        
        NSLayoutConstraint.activate([
            self.answerThreeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.5),
            self.answerThreeButton.topAnchor.constraint(equalTo: self.answerOneButton.bottomAnchor, constant: 50),
            self.answerThreeButton.widthAnchor.constraint(equalToConstant: self.buttonWidth),
            self.answerThreeButton.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        self.answerFourButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.answerFourButton)
        
        NSLayoutConstraint.activate([
            self.answerFourButton.leadingAnchor.constraint(equalTo: self.answerThreeButton.trailingAnchor, constant: 10),
            self.answerFourButton.topAnchor.constraint(equalTo: self.answerTwoButton.bottomAnchor, constant: 50),
            self.answerFourButton.widthAnchor.constraint(equalToConstant: self.buttonWidth),
            self.answerFourButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func configureLabel() {
        self.questionLabel.textAlignment = .center
        self.questionLabel.numberOfLines = 0
        self.questionLabel.alpha = 0.5
        self.questionLabel.font = UIFont(name: "GillSans-Bold", size: 25)
        self.questionLabel.textColor = .white
        self.questionLabel.backgroundColor = .clear
        self.questionLabel.lineBreakMode = .byWordWrapping
    }
}
