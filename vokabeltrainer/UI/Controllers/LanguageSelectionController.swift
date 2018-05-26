//
//  ViewController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import UIKit
import SwiftRater
import Material
import Motion

class LanguageSelectionController: HiddenCollectionViewController {
    
    let languageController = LanguageController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CardCell.classForCoder(), forCellWithReuseIdentifier: CardCell.identifier)
        
        view.backgroundColor = Config.bgcolor
        
        prepareNavigationBar()
        
        SwiftRater.check()
    }
    
    func prepareNavigationBar() {
        navigationItem.titleLabel.text = "Vokabular"
    }

}

extension LanguageSelectionController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell else {return UICollectionViewCell()}
        cell.prepare(forLanguage: Language.all[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Language.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        languageController.selectedLanguage = Language.all[indexPath.row]
        navigationController?.pushViewController(languageController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen.width, height: CardCell.height)
    }
    
}

