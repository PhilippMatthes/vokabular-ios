//
//  ExerciseCardCell.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 27/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class ExerciseCardCell: CardCell {
    static let identifier = "ExerciseCardCell"
    
    var exercise: Exercise?
    
    func prepare(forExercise exercise: Exercise) {
        self.exercise = exercise
        prep()
        let amount = exercise.load().count
        lowerLabel.text = amount == 1 ? "1 Begriff" : "\(amount) Begriffe"
        lowerLabel.textAlignment = .right
        toolbar.title = exercise.name
        toolbar.detail = "Wortschatz"
        contentLabel.text = exercise.description
    }
    
    override func prepareToolBar() {
        super.prepareToolBar()
        toolbar.backgroundColor = Config.darkbgcolor
        toolbar.animate(toBackgroundColor: Colors.color(exercise!.name), withDuration: 2.0)
    }
    
    override func prepareButtons() {
        super.prepareButtons()
        if exercise!.liked {
            favoriteButton.tintColor = CardCell.fullHeartColor
        }
    }
    
    override func favoriteButtonClicked() {
        super.favoriteButtonClicked()
        print("Favorite \(String(describing: exercise?.name))")
    }
    
    override func moreButtonClicked() {
        super.moreButtonClicked()
        print("More \(String(describing: exercise?.name))")
    }
}
