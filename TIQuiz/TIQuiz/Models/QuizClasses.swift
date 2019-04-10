//
//  QuizClasses.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 09/04/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

// MARK: Questões do Quiz
// API
//struct QuizQuestion: Codable {
//    let id, topic, question, correctAnswer: String
//    let optionsAnswer: [OptionsAnswer]
//    let createBy: [CreateBy]
//    let createAt, status: String
//}
//
//struct OptionsAnswer: Codable {
//    let optionsID: Int
//    let answer: String
//}
//
//struct CreateBy: Codable {
//    let institution, teacherName, teacherEmail: String
//}

struct QuizQuestion {
let id, question, topic, correctAnswer: String
let optionsAnswer: [OptionsAnswer]
let creatBy: [CreatBy]
let status, createdAt, updatedAt: String
let v: Int
}

struct CreatBy {
    let id, intitution, teacherName, teacherEmail: String
}

struct OptionsAnswer {
    let optionsID: Int
    let id, answer: String
}

// MARK: Tópicos
// JSON
struct QuizTopic: Codable {
    let id, topic: String
}

// MARK: Instituição
// API
struct QuizInstitution: Codable {
    let id, name, site, email: String
    let status: String
}
