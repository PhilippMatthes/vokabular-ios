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
        let count = language.exercises().count
        lowerLabel.text = count == 1 ? "1 Übung" : "\(count) Übungen"
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
        if Bool(language!.liked)! {
            favoriteButton.tintColor = CardCell.fullHeartColor
        }
    }
    
    override func favoriteButtonClicked() {
        super.favoriteButtonClicked()
        language!.liked = String(!(Bool(language!.liked)!))
    }
    
    override func moreButtonClicked() {
        super.moreButtonClicked()
        print("More \(String(describing: language?.name))")
    }
}
