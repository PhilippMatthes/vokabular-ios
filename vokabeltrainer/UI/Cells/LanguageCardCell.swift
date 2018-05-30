//
//  LanguageCardCell.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 27/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class LanguageCardCell: CardCell {
    static let identifier = "LanguageCardCell"
    
    var language: Language?
    
    func prepare(forLanguage language: Language) {
        self.language = language
        prep(hidden: Bool(language.hidden)!)
        let count = language.exercises().count
        lowerLabel.text = count == 1 ? "1 Übung" : "\(count) Übungen"
        lowerLabel.textAlignment = .right
        toolbar.title = language.name
        toolbar.detail = "Interaktive Übungen"
        contentLabel.text = language.description
    }
    
    override func prepareToolBar() {
        super.prepareToolBar()
        toolbar.backgroundColor = Colors.color(language!.name)
    }
    
    override func prepareButtons(hidden: Bool) {
        super.prepareButtons(hidden: hidden)
        if Bool(language!.liked)! {
            favoriteButton.tintColor = CardCell.fullHeartColor
        }
    }
    
    override func performFavoriteAction() {
        super.performFavoriteAction()
        language!.liked = String(!(Bool(language!.liked)!))
    }
    
    override func performHideAction() {
        super.performHideAction()
        language!.hidden = String(!Bool(language!.hidden)!)
    }
}
