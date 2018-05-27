//
//  HiddenTableViewController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import Material

class CardCellBaseCollectionViewController: CardCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dividerColor = .clear
        collectionView.borderColor = .clear
        collectionView.shadowColor = .clear
        collectionView.backgroundColor = .clear
        collectionView.tintColor = .clear
        
        view.backgroundColor = Config.bgcolor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        layoutSubviews()
    }
    
    func prepareNavigationBar(title: String) {
        navigationItem.titleLabel.text = title
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen.width, height: CardCell.height)
    }
    
}
