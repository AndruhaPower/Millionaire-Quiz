//
//  SettingsCustomView.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit


class SettingsCustomView: UIView {
    
    var segmentedControl = UISegmentedControl()
    var createQuestionButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemIndigo
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        let items: [String] = ["Последовательно", "Вперемешку"]
        let segmentedControl = UISegmentedControl(items: items)
        self.segmentedControl = segmentedControl
        
        self.segmentedControl.selectedSegmentIndex = 1
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.segmentedControl)
        
        self.segmentedControl.selectedSegmentTintColor = .systemGreen
        self.segmentedControl.backgroundColor = .black
        self.segmentedControl.tintColor = .white
        
        
        NSLayoutConstraint.activate([
            self.segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            self.segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.segmentedControl.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        self.createQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.createQuestionButton)
        
        NSLayoutConstraint.activate([
            self.createQuestionButton.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 50),
            self.createQuestionButton.heightAnchor.constraint(equalToConstant: 60),
            self.createQuestionButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            self.createQuestionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.configButton(button: self.createQuestionButton, text: "Создать свой вопрос")
    }
    
    private func configButton(button: UIButton, text: String) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.alpha = 0.7
        button.layer.cornerRadius = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitle(text, for: .normal)
    }
}
