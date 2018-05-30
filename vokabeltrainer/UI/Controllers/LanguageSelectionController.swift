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
    
    var hidden: Bool!
    
    var languages: [Language]!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        prepareNavigationBar(title: "Vokabular")
        prepareNavigationBarButtons()
        SwiftRater.check()
        collectionView.register(LanguageCardCell.classForCoder(), forCellWithReuseIdentifier: LanguageCardCell.identifier)
        collectionView.register(CreateNewCell.classForCoder(), forCellWithReuseIdentifier: CreateNewCell.identifier)
        loadLanguages(hidden: hidden)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if wasPopped {
            loadLanguages(hidden: hidden)
            collectionView.reloadData()
        }
    }
    
    func loadLanguages(hidden: Bool) {
        languages = Database.main.languages.filter {Bool($0.liked)!}
        languages.append(contentsOf: Database.main.languages.filter {!Bool($0.liked)!})
        if hidden {
            languages = languages.filter {Bool($0.hidden)!}
        } else {
            languages = languages.filter {!Bool($0.hidden)!}
        }
    }
    
    func prepareNavigationBarButtons() {
        let button = IconButton(image: Icon.moreHorizontal, tintColor: Color.blue.base)
        navigationItem.rightViews = [button]
        button.add(for: .touchUpInside) {
            self.navigationDrawerController?.openRightView()
        }
    }

}

extension LanguageSelectionController: CardCellDelegate {
    func cardCellDidSelectHide() {
        loadLanguages(hidden: hidden)
        collectionView.reloadData()
    }
    
    func cardCellDidSelectLike() {
        
    }
}

extension LanguageSelectionController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == languages.count {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateNewCell.identifier, for: indexPath) as? CreateNewCell else {return UICollectionViewCell()}
            cell.prep()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCardCell.identifier, for: indexPath) as? LanguageCardCell else {return UICollectionViewCell()}
            cell.prepare(forLanguage: languages[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == languages.count {
            return CGSize(width: Screen.width, height: CreateNewCell.height)
        } else {
            return CGSize(width: Screen.width, height: CardCell.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == languages.count {
            print("create new")
        } else {
            let languageController = LanguageController()
            languageController.selectedLanguage = languages[indexPath.row]
            languageController.hidden = false
            navigationController?.pushViewController(languageController, animated: true)
        }
    }
    
}

