//
//  Database.swift
//  sightseeker
//
//  Created by Philipp Matthes on 11.05.18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Database {
    static let main = Database()
    
    var languages: [Language]! {
        didSet {
            NSKeyedArchiver.setClassName("Language", for: Language.self)
            UserDefaults.save(object: languages, withIdentifier: "languages")
        }
    }
    var exercises: [Exercise]! {
        didSet {
            NSKeyedArchiver.setClassName("Exercise", for: Exercise.self)
            UserDefaults.save(object: exercises, withIdentifier: "exercises")
        }
    }
    
    private init() {
        NSKeyedUnarchiver.setClass(Language.self, forClassName: "Language")
        if let languages = UserDefaults.loadObject(ofType: [Language](), withIdentifier: "languages") {
            self.languages = languages
        } else {
            guard let languagescsv = Database.readDataFromCSV(fileName: "languages", fileType: "csv") else {return}
            setLanguages(
                Database.csv(data: languagescsv)
                .filter {$0.count == 3}
                .map {Language(id: $0[0], name: $0[1], description: $0[2])}
            )
        }
        NSKeyedUnarchiver.setClass(Exercise.self, forClassName: "Exercise")
        if let exercises = UserDefaults.loadObject(ofType: [Exercise](), withIdentifier: "exercises") {
            self.exercises = exercises
        } else {
            guard let exercisescsv = Database.readDataFromCSV(fileName: "exercises", fileType: "csv") else {return}
            setExercises(
                Database.csv(data: exercisescsv)
                .filter {$0.count == 5}
                .map {Exercise(languageId: $0[0], id: $0[1], name: $0[2], csvfile: $0[3], description: $0[4])}
            )
        }
    }
    
    func setLanguages(_ languages: [Language]) {
        self.languages = languages
    }
    
    func setExercises(_ exercises: [Exercise]) {
        self.exercises = exercises
    }
}

extension Database {
    
    static func csv(data: String) -> [[String]] {
        return data.components(separatedBy: "\n")
            .map { $0.components(separatedBy: ";") }
    }
    
    static func stripRowsFrom(csvString string: String) -> String {
        return string
            .replacingOccurrences(of: "\r", with: "\n")
            .replacingOccurrences(of: "\n\n", with: "\n")
    }
    
    static func readDataFromCSV(fileName:String, fileType: String)-> String! {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = stripRowsFrom(csvString: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
}
