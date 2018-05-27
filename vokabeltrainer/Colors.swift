//
//  Color.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 27/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    static let all = [
        UIColor(rgb: 0xfc5c65, alpha: 1.0),
        UIColor(rgb: 0xfd9644, alpha: 1.0),
        UIColor(rgb: 0xfed330, alpha: 1.0),
        UIColor(rgb: 0x26de81, alpha: 1.0),
        UIColor(rgb: 0x2bcbba, alpha: 1.0),
        UIColor(rgb: 0xeb3b5a, alpha: 1.0),
        UIColor(rgb: 0xfa8231, alpha: 1.0),
        UIColor(rgb: 0xf7b731, alpha: 1.0),
        UIColor(rgb: 0x20bf6b, alpha: 1.0),
        UIColor(rgb: 0x0fb9b1, alpha: 1.0),
        UIColor(rgb: 0x45aaf2, alpha: 1.0),
        UIColor(rgb: 0x4b7bec, alpha: 1.0),
        UIColor(rgb: 0xa55eea, alpha: 1.0),
        UIColor(rgb: 0x3c40c6, alpha: 1.0),
        UIColor(rgb: 0xf53b57, alpha: 1.0),
    ]
    
    static func color(_ str: String) -> UIColor {
        return all[str.count % all.count]
    }
}
