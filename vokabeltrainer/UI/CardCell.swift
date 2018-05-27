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
    
    static let height: CGFloat = 250
    
    static let fullHeartColor: UIColor = Color.red.base
    static let emptyHeartColor: UIColor = Color.grey.base
    
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
        favoriteButton = IconButton(image: Icon.favorite, tintColor: CardCell.emptyHeartColor)
        favoriteButton.add(for: .touchUpInside) {
            self.favoriteButtonClicked()
        }
        
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.white)
        moreButton.add(for: .touchUpInside) {
            self.moreButtonClicked()
        }
    }
    
    func prepareToolBar() {
        toolbar = Toolbar(rightViews: [moreButton])
        toolbar.title = "Toolbar Title"
        toolbar.titleLabel.textColor = Color.white
        toolbar.titleLabel.textAlignment = .left
        toolbar.detail = "Toolbar Detail"
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.white
        toolbar.layer.cornerRadius = 2.0
    }
    
    func prepareContentView() {
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.text = "Content Label Text"
        contentLabel.font = RobotoFont.regular(with: 14)
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
        
        card!.contentView = contentLabel
        card!.contentViewEdgeInsetsPreset = .wideRectangle4
        
        card!.bottomBar = bottomBar
        card!.bottomBarEdgeInsetsPreset = .wideRectangle2
        
        card!.frame = CGRect(center: bounds.center, size: CGSize(width: bounds.size.width - 20, height: CardCell.height))
        
        card!.backgroundColor = Color.white.withAlphaComponent(0.2)
        card!.animate(toBackgroundColor: Color.white, withDuration: 1.0)
        card!.bottomBar!.backgroundColor = .clear
    }
    
    func favoriteButtonClicked() {
        favoriteButton.tintColor = favoriteButton.tintColor == CardCell.fullHeartColor ? CardCell.emptyHeartColor : CardCell.fullHeartColor
    }
    
    func moreButtonClicked() {
        
    }
    
}
