//
//  TransparentCardCell.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 30/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material

class TransparentCardCell: CardCollectionViewCell {
    func prepareColor() {
        tintColor = .clear
        backgroundColor = .clear
        pulseColor = .clear
        shadowColor = .clear
        borderColor = .clear
        dividerColor = .clear
    }
}
