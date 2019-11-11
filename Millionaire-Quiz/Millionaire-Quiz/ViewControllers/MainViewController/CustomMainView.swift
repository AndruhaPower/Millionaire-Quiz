//
//  CustomMainView.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 05/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CustomMainView: UIView {
    
    let items: [String] = ["Section 1", "Section 2"]
    var imageView = UIImageView()
    var startGameButton = UIButton()
    var recordsButton = UIButton()
    var highestScore = UILabel()
    var settingsButton = UIButton()
    
    var imageURL: String = "https://static.1tv.ru/uploads/project/logo_image/2017/08/23/322/_original/322_c144e2880b.png"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemIndigo
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageView)
        self.imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalToConstant: 500),
            self.imageView.heightAnchor.constraint(equalToConstant: 300),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        ])
        
        self.startGameButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.startGameButton)
        
        NSLayoutConstraint.activate([
            self.startGameButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 50),
            self.startGameButton.heightAnchor.constraint(equalToConstant: 60),
            self.startGameButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            self.startGameButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        configButton(button: self.startGameButton, text: "Начать игру!")
        
        self.recordsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.recordsButton)
        
        NSLayoutConstraint.activate([
            self.recordsButton.topAnchor.constraint(equalTo: self.startGameButton.bottomAnchor, constant: 30),
            self.recordsButton.heightAnchor.constraint(equalToConstant: 60),
            self.recordsButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            self.recordsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        configButton(button: self.recordsButton, text: "Таблица результатов")
        
        self.settingsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.settingsButton)
        
        NSLayoutConstraint.activate([
            self.settingsButton.topAnchor.constraint(equalTo: self.recordsButton.bottomAnchor, constant: 30),
            self.settingsButton.heightAnchor.constraint(equalToConstant: 60),
            self.settingsButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            self.settingsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        configButton(button: self.settingsButton, text: "Настройки")
        
        self.highestScore.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.highestScore)
        
        NSLayoutConstraint.activate([
            self.highestScore.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.highestScore.topAnchor.constraint(lessThanOrEqualTo: self.settingsButton.bottomAnchor, constant: 50),
            self.highestScore.heightAnchor.constraint(equalToConstant: 45),
            self.highestScore.widthAnchor.constraint(greaterThanOrEqualToConstant: 250)
        ])
    
        self.highestScore.textAlignment = .center
        self.highestScore.text = ""
        self.highestScore.alpha = 0.3
        self.highestScore.textColor = .white
        self.highestScore.backgroundColor = .black
    }
    
    
    func configButton(button: UIButton, text: String) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.alpha = 0.7
        button.layer.cornerRadius = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitle(text, for: .normal)
    }
}
