//
//  Question.swift
//  A3
//
//  Created by hphngan on 2024-03-23.
//

import Foundation
// Defines a structure to represent a question in the quiz.
struct Question {
    var text : String
    var type : ResponseType
    var answers : [Answer]
}
// Enumerates the types of responses that a question can require.
enum ResponseType {
    case single, multiple, ranged
}
// Defines a structure to represent a possible answer to a question.
struct Answer {
    var text : String
    var type : AnimalType
}
// Enumerates the types of animals that can represent the quiz taker's personality.
enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", tutrle = "🐢"
    
    var definition : String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .tutrle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}
