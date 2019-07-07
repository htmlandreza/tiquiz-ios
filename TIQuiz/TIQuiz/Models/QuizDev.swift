//
//  QuizDev.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 02/07/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

struct QuizesFirebase: Codable {
    let correctAnswer: String
    let options: [String]
    let question: String
    
    init(correctAnswer: String, options: [String], question: String) {
        self.correctAnswer = correctAnswer
        self.options = options
        self.question = question
    }
}
