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
    
    var selectedLanguage: Language?
    var hidden: Bool!
    var exercises: [Exercise]!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        prepareNavigationBar(title: selectedLanguage?.name ?? "Alle Übungen")
        collectionView.register(ExerciseCardCell.classForCoder(), forCellWithReuseIdentifier: ExerciseCardCell.identifier)
        loadExercises(hidden: hidden)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if wasPopped {
            loadExercises(hidden: hidden)
            collectionView.reloadData()
        }
    }
    
    func loadExercises(hidden: Bool) {
        var unsortedExercises: [Exercise]
        if let lang = selectedLanguage {
            unsortedExercises = lang.exercises()
        } else {
            unsortedExercises = Database.main.exercises
        }
        exercises = unsortedExercises.filter {Bool($0.liked)!}
        exercises.append(contentsOf: unsortedExercises.filter {!Bool($0.liked)!})
        if hidden {
            exercises = exercises.filter {Bool($0.hidden)!}
        } else {
            exercises = exercises.filter {!Bool($0.hidden)!}
        }
    }
    
}

extension LanguageController: CardCellDelegate {
    func cardCellDidSelectHide() {
        loadExercises(hidden: hidden)
        collectionView.reloadData()
    }
    
    func cardCellDidSelectLike() {
        
    }
}

extension LanguageController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCardCell.identifier, for: indexPath) as? ExerciseCardCell else {return UICollectionViewCell()}
        cell.prepare(forExercise: exercises[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen.width, height: CardCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ExerciseController") as! ExerciseController
        vc.exercise = exercises[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
