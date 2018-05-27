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

class LanguageController: CardCellBaseCollectionViewController {
    
    var selectedLanguage: Language!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        prepareNavigationBar(title: selectedLanguage.name)
        collectionView.register(ExerciseCardCell.classForCoder(), forCellWithReuseIdentifier: ExerciseCardCell.identifier)
    }
    
    
}

extension LanguageController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedLanguage.exercises.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCardCell.identifier, for: indexPath) as? ExerciseCardCell else {return UICollectionViewCell()}
        cell.prepare(forExercise: selectedLanguage.exercises[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ExerciseController") as! ExerciseController
        vc.exercise = selectedLanguage.exercises[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
