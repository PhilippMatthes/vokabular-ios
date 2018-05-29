//
//  Word.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 29/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

struct Word {
    var original: String
    var translation: String
    
    init(_ tuple: [String]) {
        original = tuple[0]
        translation = tuple[1]
    }
}
