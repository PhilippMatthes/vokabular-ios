//
//  CardCell.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material
import Motion
import UIKit

class CardCell: CardCollectionViewCell {
    
    static let identifier = "CardCell"
    static let height: CGFloat = 200
    
    var toolbar: Toolbar!
    var moreButton: IconButton!
    var bottomBar: Bar!
    var favoriteButton: IconButton!
    var lowerLabel: UILabel!
    var contentLabel: UILabel!
    
    func prep() {
        prepareColor()
        prepareLowerLabel()
        prepareButtons()
        prepareToolBar()
        prepareContentView()
        prepareBottomBar()
        prepareCard()
    }
    
    func prepare(forExercise exercise: Exercise) {
        prep()
        let amount = exercise.load().count
        lowerLabel.text = amount == 1 ? "1 Begriff" : "\(amount) Begriffe"
        lowerLabel.textAlignment = .right
        toolbar.title = exercise.name
        toolbar.detail = "Wortschatz"
        contentLabel.text = exercise.description
    }
    
    func prepare(forLanguage language: Language) {
        prep()
        lowerLabel.text = language.exercises.count == 1 ? "1 Übung" : "\(language.exercises.count) Übungen"
        lowerLabel.textAlignment = .right
        toolbar.title = language.name
        toolbar.detail = "Interaktive Übungen"
        contentLabel.text = language.description
    }
    
    func prepareColor() {
        tintColor = .clear
        backgroundColor = .clear
        pulseColor = .clear
        shadowColor = .clear
        borderColor = .clear
        dividerColor = .clear
    }
    
    func prepareLowerLabel() {
        lowerLabel = UILabel()
        lowerLabel.font = RobotoFont.regular(with: 12)
        lowerLabel.textColor = Color.grey.base
        lowerLabel.text = "Lower Label Text"
    }
    
    func prepareButtons() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.grey.base)
    }
    
    func prepareToolBar() {
        toolbar = Toolbar(rightViews: [moreButton])
        toolbar.title = "Toolbar Title"
        toolbar.titleLabel.textAlignment = .left
        toolbar.detail = "Toolbar Detail"
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.grey.base
    }
    
    func prepareContentView() {
        contentLabel = UILabel()
        contentLabel.numberOfLines = 420
        contentLabel.text = "Content Label Text"
        contentLabel.font = RobotoFont.regular(with: 14)
        contentLabel.backgroundColor = Color.grey.lighten5
    }
    
    func prepareBottomBar() {
        bottomBar = Bar()
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [lowerLabel]
    }
    
    func prepareCard() {
        card = Card()
        
        card!.toolbar = toolbar
        card!.toolbarEdgeInsetsPreset = .square3
        card!.toolbarEdgeInsets.bottom = 0
        card!.toolbarEdgeInsets.right = 8
        
        card!.contentView = contentLabel
        card!.contentViewEdgeInsetsPreset = .wideRectangle3
        
        card!.bottomBar = bottomBar
        card!.bottomBarEdgeInsetsPreset = .wideRectangle2
        
        contentView.layout(card!).horizontally(left: 10, right: 10).center()
        
        guard let recognizers = gestureRecognizers else {return}
        for recognizer in recognizers {
            recognizer.cancelsTouchesInView = false
        }
    }
    
}
