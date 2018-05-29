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

class LanguageSelectionController: CardCellBaseCollectionViewController {
    
    let languageController = LanguageController()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        prepareNavigationBar(title: "Vokabular")
        SwiftRater.check()
        collectionView.register(LanguageCardCell.classForCoder(), forCellWithReuseIdentifier: LanguageCardCell.identifier)
    }

}

extension LanguageSelectionController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCardCell.identifier, for: indexPath) as? LanguageCardCell else {return UICollectionViewCell()}
        cell.prepare(forLanguage: Database.main.languages[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Database.main.languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        languageController.selectedLanguage = Database.main.languages[indexPath.row]
        navigationController?.pushViewController(languageController, animated: true)
    }
    
}

