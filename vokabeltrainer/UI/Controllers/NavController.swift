//
//  NavigationController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material
import UIKit

class NavController: NavigationController {
    
    override func prepare() {
        super.prepare()
        
        guard let bar = navigationBar as? NavigationBar else {return}
        
        bar.depthPreset = .none
        bar.dividerColor = Color.grey.lighten2
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}
