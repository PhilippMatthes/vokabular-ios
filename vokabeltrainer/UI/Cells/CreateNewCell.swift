//
//  CreateNewCell.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 30/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material

class CreateNewCell: TransparentCardCell {
    
    static let identifier = "CreateNewCell"
    static let height: CGFloat = 50

    var contentLabel: UILabel!
    
    func prep() {
        prepareColor()
        prepareContentView()
        prepareCard()
    }
    
    func prepareContentView() {
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .center
        contentLabel.textColor = .white
        contentLabel.text = "Neue Sprache anlegen"
        contentLabel.font = RobotoFont.regular(with: 15)
    }
    
    func prepareCard() {
        card = Card()
        
        card!.contentView = contentLabel
        card!.contentViewEdgeInsetsPreset = .wideRectangle4
        
        card!.frame = CGRect(center: bounds.center, size: CGSize(width: bounds.size.width - 20, height: CardCell.height))
        
        card!.backgroundColor = .clear
        card!.layer.borderWidth = 3.0
        card!.layer.borderColor = UIColor.white.cgColor
    }
    
}
