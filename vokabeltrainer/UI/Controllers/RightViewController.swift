//
//  RightViewController.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 30/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation
import UIKit
import Material

class RightViewController: UIViewController {
    @IBOutlet weak var hiddenExercisesButton: FlatButton!
    @IBOutlet weak var hiddenLanguagesButton: FlatButton!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.white
        prepareExercisesButton()
        prepareLanguagesButton()
        prepareInformationLabel()
    }
}

extension RightViewController {
    func prepareExercisesButton() {
        hiddenExercisesButton.titleLabel?.font = RobotoFont.bold(with: 20.0)
        hiddenExercisesButton.pulseColor = .white
        hiddenExercisesButton.backgroundColor = Config.bgcolor
        hiddenExercisesButton.titleColor = .white
        hiddenExercisesButton.addTarget(self, action: #selector(handleExercisesButton), for: .touchUpInside)
    }
    
    func prepareLanguagesButton() {
        hiddenLanguagesButton.titleLabel?.font = RobotoFont.bold(with: 20.0)
        hiddenLanguagesButton.pulseColor = .white
        hiddenLanguagesButton.backgroundColor = Config.bgcolor
        hiddenLanguagesButton.titleColor = .white
        hiddenLanguagesButton.addTarget(self, action: #selector(handleLanguagesButton), for: .touchUpInside)
    }
    
    func prepareInformationLabel() {
        informationLabel.textColor = Color.grey.darken3
        informationLabel.font = RobotoFont.light(with: 15.0)
    }
}

extension RightViewController {
    @objc
    fileprivate func handleExercisesButton() {
        guard let navDrawerController = navigationDrawerController else {return}
        guard let navController = navDrawerController.rootViewController as? NavController else {return}
        let pushViewController = LanguageController()
        pushViewController.hidden = true
        navController.pushViewController(pushViewController, animated: true)
        self.navigationDrawerController?.closeRightView()
    }
    
    @objc
    fileprivate func handleLanguagesButton() {
        guard let navDrawerController = navigationDrawerController else {return}
        guard let navController = navDrawerController.rootViewController as? NavController else {return}
        let pushViewController = LanguageSelectionController()
        pushViewController.hidden = true
        navController.pushViewController(pushViewController, animated: true)
        self.navigationDrawerController?.closeRightView()
    }
}
