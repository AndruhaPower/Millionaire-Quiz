//
//  CustomTableViewCell.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 12/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "CreateQuestion"
    
    var label = UILabel()
    var questionTextField = UITextField()
    var answerOneTextField = UITextField()
    var answerTwoTextField = UITextField()
    var answerThreeTextField = UITextField()
    var answerFourTextField = UITextField()
    
    var correctAnswerSwitch = UISegmentedControl()
    var saveQuestion = UIButton()
    var commitQuestion = UIButton()
    var deleteQuestion = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemIndigo
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.label)
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.label.widthAnchor.constraint(equalToConstant: 300),
            self.label.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        self.label.textAlignment = .center
        self.label.text = "Создайте свой вопрос"
        self.label.textColor = .black
        self.label.backgroundColor = .clear
        
        self.questionTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.questionTextField)
        
        NSLayoutConstraint.activate([
            self.questionTextField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 0),
            self.questionTextField.heightAnchor.constraint(equalToConstant: 30),
            self.questionTextField.widthAnchor.constraint(equalToConstant: 400),
            self.questionTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.questionTextField.backgroundColor = .black
        self.questionTextField.alpha = 0.7
        self.questionTextField.textColor = .white
        self.questionTextField.layer.cornerRadius = 15
        self.questionTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        
        self.setupTextFields(field: self.answerOneTextField, previous: self.questionTextField)
        self.setupTextFields(field: self.answerTwoTextField, previous: self.answerOneTextField)
        self.setupTextFields(field: self.answerThreeTextField, previous: self.answerTwoTextField)
        self.setupTextFields(field: self.answerFourTextField, previous: self.answerThreeTextField)
        
        self.questionTextField.placeholder = " Введите свой вопрос"
        self.answerOneTextField.placeholder = " Введите 1-ый вариант ответа"
        self.answerTwoTextField.placeholder = " Введите 2-ой вариант ответа"
        self.answerThreeTextField.placeholder = " Введите 3-ий вариант ответа"
        self.answerFourTextField.placeholder = " Введите 4-ый вариант ответа"
        
        let items: [String] = ["1", "2", "3", "4"]
        let correctAnswerSwitch = UISegmentedControl(items: items)
        self.correctAnswerSwitch = correctAnswerSwitch
        
        self.correctAnswerSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.correctAnswerSwitch)
        
        NSLayoutConstraint.activate([
            self.correctAnswerSwitch.topAnchor.constraint(equalTo: self.answerFourTextField.bottomAnchor, constant: 30),
            self.correctAnswerSwitch.heightAnchor.constraint(equalToConstant: 30),
            self.correctAnswerSwitch.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.correctAnswerSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        self.correctAnswerSwitch.selectedSegmentTintColor = .systemGreen
        self.correctAnswerSwitch.backgroundColor = .black
        self.correctAnswerSwitch.tintColor = .white
        
        self.saveQuestion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.saveQuestion)
        
        NSLayoutConstraint.activate([
            self.saveQuestion.topAnchor.constraint(equalTo: self.correctAnswerSwitch.bottomAnchor, constant: 10),
            self.saveQuestion.widthAnchor.constraint(equalToConstant: 200),
            self.saveQuestion.heightAnchor.constraint(equalToConstant: 30),
            self.saveQuestion.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.saveQuestion.setTitle("Сохранить", for: .normal)
        self.saveQuestion.backgroundColor = .black
        
        self.commitQuestion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.commitQuestion)
        
        NSLayoutConstraint.activate([
            self.commitQuestion.topAnchor.constraint(equalTo: self.correctAnswerSwitch.bottomAnchor, constant: 10),
            self.commitQuestion.leadingAnchor.constraint(equalTo: self.saveQuestion.trailingAnchor, constant: 40),
            self.commitQuestion.heightAnchor.constraint(equalToConstant: 30),
            self.commitQuestion.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        self.commitQuestion.setTitle("+", for: .normal)
        self.commitQuestion.backgroundColor = .black
        
        self.deleteQuestion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.deleteQuestion)
        
        NSLayoutConstraint.activate([
            self.deleteQuestion.topAnchor.constraint(equalTo: self.correctAnswerSwitch.bottomAnchor, constant: 10),
            self.deleteQuestion.trailingAnchor.constraint(equalTo: self.saveQuestion.leadingAnchor, constant:-40),
            self.deleteQuestion.heightAnchor.constraint(equalToConstant: 30),
            self.deleteQuestion.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        self.deleteQuestion.setTitle("-", for: .normal)
        self.deleteQuestion.backgroundColor = .black
    }
    
    private func setupTextFields(field: UITextField, previous: UITextField) {
        field.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(field)
        
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10),
            field.widthAnchor.constraint(equalToConstant: 400),
            field.heightAnchor.constraint(equalToConstant: 30),
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        field.backgroundColor = .black
        field.textColor = .white
        field.alpha = 0.7
        field.layer.cornerRadius = 15
        field.layer.borderColor = UIColor.darkGray.cgColor
    }
}
