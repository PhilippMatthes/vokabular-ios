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
        prep(hidden: Bool(exercise.hidden)!)
        let amount = exercise.load().count
        lowerLabel.text = amount == 1 ? "1 Begriff" : "\(amount) Begriffe"
        lowerLabel.textAlignment = .right
        toolbar.title = exercise.name
        toolbar.detail = "Wortschatz"
        contentLabel.text = exercise.description
    }
    
    override func prepareToolBar() {
        super.prepareToolBar()
        toolbar.backgroundColor = Colors.color(exercise!.name)
    }
    
    override func prepareButtons(hidden: Bool) {
        super.prepareButtons(hidden: hidden)
        if Bool(exercise!.liked)! {
            favoriteButton.tintColor = CardCell.fullHeartColor
        }
    }
    
    override func performFavoriteAction() {
        super.performFavoriteAction()
        exercise!.liked = String(!Bool(exercise!.liked)!)
    }
    
    override func performHideAction() {
        super.performHideAction()
        exercise!.hidden = String(!Bool(exercise!.hidden)!)
    }
}
