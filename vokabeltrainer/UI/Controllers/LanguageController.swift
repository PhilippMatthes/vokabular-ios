//
//  LanguageController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import UIKit
import Material

class LanguageController: HiddenCollectionViewController {
    
    var selectedLanguage: Language!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CardCell.classForCoder(), forCellWithReuseIdentifier: CardCell.identifier)
        
        view.backgroundColor = Config.bgcolor
        
        prepareNavigationBar()
    }
    
    func prepareNavigationBar() {
        navigationItem.titleLabel.text = selectedLanguage.name
    }
    
}

extension LanguageController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedLanguage.exercises.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell else {return UICollectionViewCell()}
        cell.prepare(forExercise: selectedLanguage.exercises[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen.width, height: CardCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ExerciseController") as! ExerciseController
        vc.exercise = selectedLanguage.exercises[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
