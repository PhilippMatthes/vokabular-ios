//
//  Exercise.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

struct Exercise {
    var name: String
    var csvfile: String
    var description: String
    var liked: Bool
    var highscore: Int
    
    init(name: String, csvfile: String, description: String, liked: Bool = false, highscore: Int = 0) {
        self.name = name
        self.csvfile = csvfile
        self.description = description
        self.liked = liked
        self.highscore = highscore
    }
    
    func load() -> [[String]] {
        guard let csv = Database.readDataFromCSV(fileName: csvfile, fileType: "csv") else {return [[String]]()}
        return Database.csv(data: csv).filter {$0.count == 2}
    }
    
    private enum CodingKeys: String, CodingKey {
        case name = "exercise_name"
        case csvfile = "exercise_file"
        case description = "exercise_description"
        case liked = "exercise_liked"
        case highscore = "exercise_highscore"
    }
}
