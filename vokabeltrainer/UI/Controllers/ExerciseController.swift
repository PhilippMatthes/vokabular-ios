//
//  ExerciseController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import UIKit
import Material

class ExerciseController: UIViewController {
    
    @IBOutlet var titleButton: RaisedButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var button1: RaisedButton!
    @IBOutlet var button2: RaisedButton!
    @IBOutlet var button3: RaisedButton!
    @IBOutlet var button4: RaisedButton!
    
    static let animations: [UIViewAnimationOptions] = [
        UIViewAnimationOptions.transitionFlipFromRight,
        UIViewAnimationOptions.transitionFlipFromTop,
        UIViewAnimationOptions.transitionFlipFromLeft,
        UIViewAnimationOptions.transitionFlipFromBottom,
    ]
    
    var exercise: Exercise!
    var content: [[String]]!
    var solution: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = exercise.load()
        prepare()
        loadWords()
    }
    
    func prepare() {
        navigationItem.titleLabel.text = exercise.name
        label.text = "Bedeutet auf Spanisch..."
        for button in allButtons() {
            button.tintColor = .white
            button.backgroundColor = Config.bgcolor
        }
        titleButton.backgroundColor = Config.bgcolor
        titleButton.tintColor = .white
        button1.add(for: .touchUpInside) {self.checkSolution()}
        button2.add(for: .touchUpInside) {self.checkSolution()}
        button3.add(for: .touchUpInside) {self.checkSolution()}
        button4.add(for: .touchUpInside) {self.checkSolution()}
    }
    
    func reset() {
        for button in allButtons() {
            button.animate(toBackgroundColor: Config.bgcolor, withDuration: 0.5)
        }
        loadWords()
    }
    
    func checkSolution() {
        for button in allButtons() {
            let correct = button.titleLabel!.text! == solution
            button.animate(toBackgroundColor: correct ? Config.correctColor : Config.wrongColor, withDuration: 0.1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.reset()
        }
    }
    
    func allButtons() -> [RaisedButton] {
        return [button1, button2, button3, button4]
    }
    
    func loadWords() {
        content.shuffle()
        let word = content[0][1]
        solution = content[0][0]
        var solutions = [solution, content[1][0], content[2][0], content[3][0]]
        solutions.shuffle()
        let animation = ExerciseController.animations.randomItem()!
        UIView.transition(with: titleButton, duration: 0.5, options: animation, animations: {
            self.titleButton.setTitle(word, for: .normal)
        }, completion: nil)
        UIView.transition(with: button1, duration: 0.5, options: animation, animations: {
            self.button1.setTitle(solutions[0], for: .normal)
        }, completion: nil)
        UIView.transition(with: button2, duration: 0.5, options: animation, animations: {
            self.button2.setTitle(solutions[1], for: .normal)
        }, completion: nil)
        UIView.transition(with: button3, duration: 0.5, options: animation, animations: {
            self.button3.setTitle(solutions[2], for: .normal)
        }, completion: nil)
        UIView.transition(with: button4, duration: 0.5, options: animation, animations: {
            self.button4.setTitle(solutions[3], for: .normal)
        }, completion: nil)
    }
    
    
}
