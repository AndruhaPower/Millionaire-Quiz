//
//  ViewController.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 05/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var operationQueue = OperationQueue()
    var customView = CustomMainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            self.customView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.getImage(url: self.customView.imageURL) { (image) in
            self.customView.imageView.image = image
         }
        self.customView.startGameButton.addTarget(self, action: #selector(self.startGameButtonClicked), for: .touchUpInside)
        self.customView.recordsButton.addTarget(self, action: #selector(self.recordsButtonClicked), for: .touchUpInside)
    }
    
    func getImage(url: String, completion: @escaping (UIImage)->()) {
        let operation = LoadImageOperation()
        operation.url = URL(string: url)
        self.operationQueue.addOperation(operation)
        operation.completion = { image in
            completion(image)
        }
    }
    
    @objc func startGameButtonClicked() {
        let gameviewcontroller = GameViewController()
        self.navigationController?.pushViewController(gameviewcontroller, animated: true)
    }
    
    @objc func recordsButtonClicked() {
        let recordsViewController = RecordsViewController()
        self.navigationController?.pushViewController(recordsViewController, animated: true)
    }
}

