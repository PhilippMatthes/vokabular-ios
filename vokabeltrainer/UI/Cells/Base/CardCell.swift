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

protocol CardCellDelegate {
    func cardCellDidSelectLike()
    func cardCellDidSelectHide()
}

class CardCell: TransparentCardCell {
    
    static let height: CGFloat = 250
    
    static let fullHeartColor: UIColor = Color.red.base
    static let emptyHeartColor: UIColor = Color.grey.base
    
    var toolbar: Toolbar!
    var hideButton: IconButton!
    var bottomBar: Bar!
    var favoriteButton: IconButton!
    var lowerLabel: UILabel!
    var contentLabel: UILabel!
    
    var delegate: CardCellDelegate?
    
    func prep(hidden: Bool) {
        prepareColor()
        prepareLowerLabel()
        prepareButtons(hidden: hidden)
        prepareToolBar()
        prepareContentView()
        prepareBottomBar()
        prepareCard()
    }
    
    func prepareLowerLabel() {
        lowerLabel = UILabel()
        lowerLabel.font = RobotoFont.regular(with: 12)
        lowerLabel.textColor = Color.grey.base
        lowerLabel.text = "Lower Label Text"
    }
    
    func prepareButtons(hidden: Bool) {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: CardCell.emptyHeartColor)
        favoriteButton.add(for: .touchUpInside) {
            self.favoriteButtonClicked()
        }
        
        hideButton = IconButton(image: hidden ? Icon.cm.check : Icon.cm.close, tintColor: Color.white)
        hideButton.add(for: .touchUpInside) {
            self.hideButtonClicked()
        }
    }
    
    func prepareToolBar() {
        toolbar = Toolbar(rightViews: [hideButton])
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
        
        card!.backgroundColor = Color.white
        card!.bottomBar!.backgroundColor = .clear
    }
    
    func favoriteButtonClicked() {
        performFavoriteAction()
        favoriteButton.tintColor = favoriteButton.tintColor == CardCell.fullHeartColor ? CardCell.emptyHeartColor : CardCell.fullHeartColor
        delegate?.cardCellDidSelectLike()
    }
    
    func performFavoriteAction() {}
    
    func hideButtonClicked() {
        performHideAction()
        delegate?.cardCellDidSelectHide()
    }
    
    func performHideAction() {}
    
}
