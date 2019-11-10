//
//  CustomAnswerButton.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 06/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CustomAnswerButton: UIButton {
    
    var answer: String?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .black
        self.setTitle(self.answer, for: .normal)
        self.alpha = 0.8
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
    }
}
