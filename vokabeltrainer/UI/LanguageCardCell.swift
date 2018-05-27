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
        prep()
        lowerLabel.text = language.exercises.count == 1 ? "1 Übung" : "\(language.exercises.count) Übungen"
        lowerLabel.textAlignment = .right
        toolbar.title = language.name
        toolbar.detail = "Interaktive Übungen"
        contentLabel.text = language.description
    }
    
    override func prepareToolBar() {
        super.prepareToolBar()
        toolbar.backgroundColor = Config.bgcolor
        toolbar.animate(toBackgroundColor: Colors.color(language!.name), withDuration: 2.0)
    }
    
    override func prepareButtons() {
        super.prepareButtons()
        if language!.liked {
            favoriteButton.tintColor = CardCell.fullHeartColor
        }
    }
    
    override func favoriteButtonClicked() {
        super.favoriteButtonClicked()
        print("Favorite \(String(describing: language?.name))")
    }
    
    override func moreButtonClicked() {
        super.moreButtonClicked()
        print("More \(String(describing: language?.name))")
    }
}
