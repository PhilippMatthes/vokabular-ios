//
//  Exercise.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Exercise {
    var name: String
    var csvfile: String
    var description: String
    
    init(name: String, csvfile: String, description: String) {
        self.name = name
        self.csvfile = csvfile
        self.description = description
    }
    
    func load() -> [[String]] {
        guard let csv = Database.readDataFromCSV(fileName: csvfile, fileType: "csv") else {return [[String]]()}
        return Database.csv(data: csv).filter {$0.count == 2}
    }
}
