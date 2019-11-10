//
//  RecordsViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 06/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setupTableView()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print(Game.shared.records)
    }
    
    private func setupTableView() {
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
}

extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }

        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.textLabel?.text = "\(dateFormatter.string(from: record.date)) : \(record.score)                   \(record.percent) %"
        return cell
    }
    
    
    
}
