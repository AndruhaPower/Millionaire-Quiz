//
//  SettingsViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var customView = SettingsCustomView()
    
    private var selectedDifficulty: Difficulty {
        switch self.customView.segmentedControl.selectedSegmentIndex {
        case 0:
            Game.shared.selectedDifficulty = .straightForward
            return .straightForward
        case 1:
            Game.shared.selectedDifficulty = .straightForward
            return .allRandom
        default:
            Game.shared.selectedDifficulty = .straightForward
            return .straightForward
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
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
        
        self.customView.createQuestionButton.addTarget(self, action: #selector(self.createQuestion), for: .touchUpInside)
    }
    
    @objc func createQuestion() {
        let createQuestionViewController = CreateQuestionViewController()
        self.navigationController?.pushViewController(createQuestionViewController, animated: true)
    }
}
