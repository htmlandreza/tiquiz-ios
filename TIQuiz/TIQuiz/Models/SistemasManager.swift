//
//  QuizManager.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

class SistemasManager{
    // TODO: implementar no firebase
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
            (
                correctAnswer: "ls e dir",
                options: [
                    "ls e dir",
                    "list e mkdir",
                    "cat e rmdir",
                    "ps e dir"
                ],
                question: "No Linux e no prompt de comandos do Windows, para mostrar a lista de arquivos e diretórios presentes na unidade de armazenamento atual, por exemplo, um pen drive, utilizam-se, respectivamente, os comandos"
            ),
            (
                correctAnswer: "Os SSDs são mais resistentes do que os HDs em relação a movimentos, quedas ou interferências magnéticas",
                options: [
                    "A vida útil dos SSDs é maior do que a dos HDs",
                    "O consumo dos SSDs é maior do que o dos HDs",
                    "O preço por bit de armazenamento dos SSDs é menor do que o dos HD",
                    "Os SSDs são mais resistentes do que os HDs em relação a movimentos, quedas ou interferências magnéticas"
                ],
                question: "Embora os discos rígidos (HD) sejam ainda muito utilizados, as unidades de estado sólido (SSD) vêm cada vez mais sendo utilizadas. Comparando os HDs convencionais com os SSDs, tem-se que"
            )
    ]
    
    private var quiz: Quiz!
    private var _totalAnswers = 0
    private var _totalCorrectAnswers = 0
    
    var question: String {
        return quiz.question
    }
    
    var options: [String]{
        return quiz.options
    }
    
    var totalAnswers: Int{
        return _totalAnswers
    }
    
    var totalCorrectAnswers: Int{
        return _totalCorrectAnswers
    }
    
    // MARK: pegar um quiz novo, de forma aleatória
    func refreshQuiz() {
        let randomIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        // dados do quiz
        let quizData = quizes[randomIndex]
        // chamar o atual
        quiz = Quiz(question: quizData.question, options: quizData.options, correctedAnswer: quizData.correctAnswer)
    }
    
    // MARK: valida a resposta do usuário
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if quiz.validateOption(index) {
            _totalCorrectAnswers += 1
        }
    }
}

