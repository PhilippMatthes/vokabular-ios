//
//  Exercise.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Exercise: NSObject, NSCoding {
    var languageId: String
    var id: String
    var name: String
    var csvfile: String
    var _description: String
    var liked: String {didSet{update()}}
    var highscore: String {didSet{update()}}
    
    override var description : String {
        return _description
    }
    
    func update() {
        let exercises = Database.main.exercises
        Database.main.setExercises(exercises!)
    }
    
    init(languageId: String, id: String, name: String, csvfile: String, description: String, liked: String = "false", highscore: String = "0") {
        self.languageId = languageId
        self.id = id
        self.name = name
        self.csvfile = csvfile
        self._description = description
        self.liked = liked
        self.highscore = highscore
    }
    
    func load() -> [[String]] {
        guard let csv = Database.readDataFromCSV(fileName: csvfile, fileType: "csv") else {return [[String]]()}
        return Database.csv(data: csv).filter {$0.count == 2}
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let d = aDecoder
        guard
            let languageId = d.decodeObject(forKey: "languageId") as? String,
            let id = d.decodeObject(forKey: "exercise_id") as? String,
            let name = d.decodeObject(forKey: "name") as? String,
            let csvfile = d.decodeObject(forKey: "csvfile") as? String,
            let description = d.decodeObject(forKey: "description") as? String,
            let liked = d.decodeObject(forKey: "liked") as? String,
            let highscore = d.decodeObject(forKey: "highscore") as? String
            else {
                return nil
        }
        self.init(languageId: languageId, id: id, name: name, csvfile: csvfile, description: description, liked: liked, highscore: highscore)
    }
    
    func encode(with aCoder: NSCoder) {
        let c = aCoder
        c.encode(languageId, forKey: "languageId")
        c.encode(id, forKey: "exercise_id")
        c.encode(name, forKey: "name")
        c.encode(csvfile, forKey: "csvfile")
        c.encode(_description, forKey: "description")
        c.encode(liked, forKey: "liked")
        c.encode(highscore, forKey: "highscore")
    }
    
    override public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    static func ==(lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id && lhs.languageId == rhs.languageId
    }

}
