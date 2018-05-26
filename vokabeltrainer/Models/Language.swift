//
//  Language.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

class Language {
    
    static let all = [
        Language(
            name: "Spanisch",
            description: "¡Saca el tequila! Mit Spanisch kannst du mehr als nur stilvoll Tequila bestellen - Denn Spanisch gehört zu den meistgesprochenen Sprachen auf der Welt. Vamos!",
            exercises: [
                Exercise(
                    name: "Grundwortschatz",
                    csvfile: "german-spanish-base",
                    description: "Spanische Grundbegriffe, die dir im Alltag helfen können. Kennst du alle von ihnen?"
                ),
                Exercise(
                    name: "Farben",
                    csvfile: "german-spanish-colors",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Zahlen",
                    csvfile: "german-spanish-numbers",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Wochentage",
                    csvfile: "german-spanish-weekdays",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Monate",
                    csvfile: "german-spanish-months",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Verben",
                    csvfile: "german-spanish-verbs",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Adjektive",
                    csvfile: "german-spanish-adjectives",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Wirtschaftliche Begriffe",
                    csvfile: "german-spanish-economic",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Wegbeschreibung",
                    csvfile: "german-spanish-paths",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Umwelt",
                    csvfile: "german-spanish-environment",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Tiere",
                    csvfile: "german-spanish-animals",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Alltagsgegenstände und Einkaufswaren",
                    csvfile: "german-spanish-grocery",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Körperteile",
                    csvfile: "german-spanish-body",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Kleidung",
                    csvfile: "german-spanish-clothing",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Länder",
                    csvfile: "german-spanish-countries",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Früchte und Gemüse",
                    csvfile: "german-spanish-fruits",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
                Exercise(
                    name: "Berufe",
                    csvfile: "german-spanish-jobs",
                    description: "Zu dieser Übung gibt es noch keine passende Beschreibung. Sie wird vermutlich später noch hinzugefügt."
                ),
            ]
        ),
    ]
    
    var name: String
    var description: String
    var exercises: [Exercise]
    
    init(name: String, description: String, exercises: [Exercise]) {
        self.name = name
        self.description = description
        self.exercises = exercises
    }
    
}
