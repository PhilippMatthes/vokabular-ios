//
//  Language.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Language: NSObject, NSCoding {
    var languageId: String
    var name: String
    var _description: String
    var liked: String {didSet{update()}}
    
    override var description : String {
        return _description
    }
    
    func update() {
        let languages = Database.main.languages
        Database.main.setLanguages(languages!)
    }
    
    init(id: String, name: String, description: String, liked: String = "false") {
        self.languageId = id
        self.name = name
        self._description = description
        self.liked = liked
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let d = aDecoder
        guard
            let languageId = d.decodeObject(forKey: "language_id") as? String,
            let name = d.decodeObject(forKey: "name") as? String,
            let description = d.decodeObject(forKey: "description") as? String,
            let liked = d.decodeObject(forKey: "liked") as? String
        else {
            return nil
        }
        self.init(id: languageId, name: name, description: description, liked: liked)
    }
    
    func encode(with aCoder: NSCoder) {
        let c = aCoder
        c.encode(languageId, forKey: "language_id")
        c.encode(name, forKey: "name")
        c.encode(_description, forKey: "description")
        c.encode(liked, forKey: "liked")
    }
    
    override public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    static func ==(lhs: Language, rhs: Language) -> Bool {
        return lhs.languageId == rhs.languageId
    }
    
    func exercises() -> [Exercise] {
        return Database.main.exercises.filter {$0.languageId == self.languageId}
    }
    
}
