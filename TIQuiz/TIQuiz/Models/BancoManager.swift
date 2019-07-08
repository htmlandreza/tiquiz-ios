//
//  QuizManager.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

class BancoManager{
    // TODO: implementar no firebase
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (
            correctAnswer: "É uma coleção não-ordenada com chave e valor",
            options: [
                "É uma coleção que não aceita objetos repetidos",
                "É uma coleção ordenada com chave e valor",
                "É uma coleção não-ordenada com chave e valor",
                "É uma coleção que permite valores de tipos diferentes"
            ],
            question: "O que é um dicionário?"
        ),
        (
            correctAnswer: "Tipo definido pelo usuário para um grupo de valores relacionados",
            options: [
                "É um conjunto de Strings",
                "É um tipo especial de String",
                "É um operador unário do tipo prefix",
                "Tipo definido pelo usuário para um grupo de valores relacionados"
            ],
            question: "O que é um enum?"
        ),
        (
            correctAnswer: "É possível fazer um INNER JOIN de uma tabela para ela mesma",
            options: [
                "Somente os registros da tabela à esquerda do relacionamento INNER JOIN serão retornados",
                "É possível retornar todos os registros de todas as tabelas sem nenhuma restrição",
                "É possível fazer um INNER JOIN de uma tabela para ela mesma",
                "Somente os registros da tabela à direita do relacionamento INNER JOIN serão retornados"
            ],
            question: "Em relação ao INNER JOIN, é correto afirma que:"
        ),
        (
            correctAnswer: "Objetos, componentes, pacotes e instalação",
            options: [
                "Classe, atividade, objetos e instalação",
                "Objetos, componentes, pacotes e instalaçãocc",
                "Objetos, componentes, caso de uso e estados",
                "Classe, objetos, sequência e caso de uso"
            ],
            question: "Considerando-se os diversos tipos de diagramas UML, marque a opção que representa apenas diagramas estruturais."
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

