//
//  CreateQuestionViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {
    
    var tableView = UITableView()
    
    private var questionsCount: Int = 1
    private let questionBuilder = QuestionBuilder()
    
    private var addedQuestions = [Question]() {
        didSet {
            if QuestionData.duplicateCheck(self.addedQuestions) != false {
                QuestionData.questions.append(contentsOf: self.addedQuestions)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }
    
    private func setupTableView() {
        
        self.tableView.allowsSelection = false
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = .black
        self.tableView.backgroundColor = .black
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @objc func saveQuestionsAndQuit() {
        self.addedQuestions = questionBuilder.build(questionsCount: self.questionsCount, tableView: self.tableView)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addCell() {
        self.questionsCount += 1
        self.tableView.reloadData()
    }
    
    @objc func deleteCell() {
        guard self.questionsCount > 1 else { return }
        self.questionsCount -= 1
        self.tableView.reloadData()
    }
}

extension CreateQuestionViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.questionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.saveQuestion.addTarget(self, action: #selector(saveQuestionsAndQuit), for: .touchUpInside)
        cell.commitQuestion.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        cell.deleteQuestion.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
