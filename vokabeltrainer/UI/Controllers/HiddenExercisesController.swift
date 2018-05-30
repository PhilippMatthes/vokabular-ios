//
//  HiddenExercisesController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 30/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material

class HiddenExercisesController: CardCellBaseCollectionViewController {
    
    var exercises: [Exercise]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercises = Database.main.exercises.filter {Bool($0.hidden)!}
    }
    
}

extension HiddenExercisesController {
    
}
