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
    
    private init() {}
    
    func initate() {}
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
