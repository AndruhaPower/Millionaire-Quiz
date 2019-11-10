//
//  RecordsProvider.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 07/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

final class RecordCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key: String = "records"
    
    func save(records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}