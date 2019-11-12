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
        
        self.customView.segmentedControl.addTarget(self, action: #selector(segmentedSwitched), for: .valueChanged)
    }
    
    @objc func createQuestion() {
        let createQuestionViewController = CreateQuestionViewController()
        self.navigationController?.pushViewController(createQuestionViewController, animated: true)
    }
    
    @objc func segmentedSwitched() {
        switch self.customView.segmentedControl.selectedSegmentIndex {
        case 0:
            Game.shared.selectedDifficulty = .straightForward
        case 1:
            Game.shared.selectedDifficulty = .allRandom
        default:
            return
        }
    }
}
