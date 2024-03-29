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
import AVFoundation

enum ExerciseState {
    case WaitingForSolution
    case DisplayingSolution
}

class ExerciseController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var speechBubble: UIImageView!
    
    @IBOutlet weak var speakButton: IconButton!
    @IBOutlet var button1: RaisedButton!
    @IBOutlet var button2: RaisedButton!
    @IBOutlet var button3: RaisedButton!
    @IBOutlet var button4: RaisedButton!
    
    var gestureRecognizer: UITapGestureRecognizer?
    
    static let animations: [UIViewAnimationOptions] = [
        UIViewAnimationOptions.transitionFlipFromRight,
        UIViewAnimationOptions.transitionFlipFromTop,
        UIViewAnimationOptions.transitionFlipFromLeft,
        UIViewAnimationOptions.transitionFlipFromBottom,
    ]
    
    var state: ExerciseState = .WaitingForSolution
    
    var exercise: Exercise!
    var content: [Word]!
    var solution: String!
    var word: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = exercise.load().map {Word($0)}
        prepare()
        loadNewWords()
        titleLabel.textColor = Colors.color(word)
        view.backgroundColor = Colors.color(word)
    }
    
    func prepare() {
        navigationItem.titleLabel.text = exercise.name
        for button in allButtons() {
            button.tintColor = Color.grey.darken3
            button.backgroundColor = Color.white
            button.titleLabel?.font = RobotoFont.regular(with: 25)
            button.layer.cornerRadius = 15.0
            button.add(for: .touchUpInside) {self.checkSolution()}
        }
        titleLabel.font = RobotoFont.regular(with: 25)
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gestureRecognizer!.cancelsTouchesInView = true
        view.addGestureRecognizer(gestureRecognizer!)
        
        if exercise.language()?.languageCode == "none" {
            speakButton.setImage(Icon.cm.volumeOff, for: .normal)
            speakButton.setTitle(nil, for: .normal)
            speakButton.tintColor = Color.grey.base
            speakButton.isEnabled = false
            speakButton.layer.cornerRadius = speakButton.frame.width / 2
            speakButton.backgroundColor = .white
        } else {
            speakButton.setImage(Icon.cm.volumeHigh, for: .normal)
            speakButton.setTitle(nil, for: .normal)
            speakButton.layer.cornerRadius = speakButton.frame.width / 2
            speakButton.backgroundColor = .white
            speakButton.add(for: .touchUpInside) {self.speak()}
        }
    }
    
    func speak() {
        guard
            let textToSpeak = titleLabel.text,
            let language = exercise.language()
            else {return}
        let languageCode = language.languageCode
        let synthesizer = AVSpeechSynthesizer()
        let message = AVSpeechUtterance(string: textToSpeak)
        message.voice = AVSpeechSynthesisVoice(language: languageCode)
        message.pitchMultiplier = 1.0
        message.rate = 0.5
        synthesizer.speak(message)
    }
    
    @objc func handleTap() {
        switch state {
        case .DisplayingSolution:
            for button in allButtons() {
                let correct = button.titleLabel!.text! == solution
                let color = correct ? Config.correctColor : Config.wrongColor
                button.animateBorder(toColor: color, widthFrom: 3.0, widthTo: 0)
            }
            loadNewWords()
        case .WaitingForSolution:
            break
        }
    }
    
    func checkSolution() {
        if state == .WaitingForSolution {
        state = .DisplayingSolution
            for button in allButtons() {
                let correct = button.titleLabel!.text! == solution
                let color = correct ? Config.correctColor : Config.wrongColor
                button.animateBorder(toColor: color)
            }
        } else if state == .DisplayingSolution {
            handleTap()
        }
    }
    
    func allButtons() -> [RaisedButton] {
        return [button1, button2, button3, button4]
    }
    
    func loadNewWords() {
        content.shuffle()
        solution = content[0].original
        let words = content
            .filter {$0.original == solution}
            .map {$0.translation}
        word = words.joined(separator: ", ")
        
        let filteredContent = content.filter {$0.original != solution}
        
        var solutions = [
            solution,
            filteredContent[0].original,
            filteredContent[1].original,
            filteredContent[2].original,
        ]
        
        solutions.shuffle()
        
        let animation = ExerciseController.animations.randomItem()!
        
        let color = Colors.color(word)
        view.animate(toBackgroundColor: color, withDuration: 0.5) {}
        
        UIView.transition(with: titleLabel, duration: 0.3, options: animation, animations: {
            self.titleLabel.text = self.word
            self.titleLabel.textColor = color
        }, completion: nil)
        UIView.transition(with: speechBubble, duration: 0.3, options: animation, animations: nil, completion: nil)
        UIView.transition(with: button1, duration: 0.3, options: animation, animations: {
            self.button1.setTitle(solutions[0], for: .normal)
        }, completion: nil)
        UIView.transition(with: button2, duration: 0.3, options: animation, animations: {
            self.button2.setTitle(solutions[1], for: .normal)
        }, completion: nil)
        UIView.transition(with: button3, duration: 0.3, options: animation, animations: {
            self.button3.setTitle(solutions[2], for: .normal)
        }, completion: nil)
        UIView.transition(with: button4, duration: 0.3, options: animation, animations: {
            self.button4.setTitle(solutions[3], for: .normal)
        }, completion: nil)
        
        state = .WaitingForSolution
    }
    
    
}
