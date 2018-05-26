//
//  HiddenTableViewController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material

class HiddenCollectionViewController: CardCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dividerColor = .clear
        collectionView.borderColor = .clear
        collectionView.shadowColor = .clear
        collectionView.backgroundColor = .clear
        collectionView.tintColor = .clear
    }
    
}
