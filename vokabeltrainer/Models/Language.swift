//
//  Language.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

struct Language {
    
    var name: String
    var description: String
    var exercises: [Exercise]
    var liked: Bool
    
    init(name: String, description: String, exercises: [Exercise], liked: Bool = false) {
        self.name = name
        self.description = description
        self.exercises = exercises
        self.liked = liked
    }
    
    private enum CodingKeys: String, CodingKey {
        case name = "language_name"
        case description = "language_description"
        case exercises = "language_exercises"
        case liked = "language_liked"
    }
    
}
