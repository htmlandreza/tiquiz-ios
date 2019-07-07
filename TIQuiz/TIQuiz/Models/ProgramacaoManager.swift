//
//  QuizManager.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

class ProgramacaoManager{
    // TODO: implementar no firebase
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (
            correctAnswer: "\"11\"",
            options: [
                "11",
                "\"2\"",
                "\"11\"",
                "\"1 1\""
            ],
            question: "Qual é o resultado da expressão \"1\" + \"1\""
        ),
        (
            correctAnswer: "\\",
            options: [
                "/",
                "\\",
                "!",
                "ESC"
            ],
            question: "Qual desses símbolos é usado para \"escapar\" caracteres especiais"
        ),
        (
            correctAnswer: "Void",
            options: [
                "Void",
                "Int",
                "String",
                "nil"
            ],
            question: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?"
        ),
        (
            correctAnswer: "No próprio documento HTML, e são válidas tão somente para aquele documento específico",
            options: [
                "Em um documento, à parte do documento HTML",
                "No próprio documento HTML, e são válidas tão somente para aquele documento específico",
                "Dentro da “Tag” do elemento HTML",
                "Em um mesmo elemento, em folhas de estilos diferentes"
            ],
            question: "Em CSS, uma folha de estilo é dita incorporada ou interna quando as regras CSS estão declaradas:"
        ),
        (
            correctAnswer: "String?",
            options: [
                "String",
                "String?",
                "Int",
                "Void"
            ],
            question: "Qual é o tipo de uma variavél String que pode aceitar nil?"
        ),
        (
            correctAnswer: "let",
            options: [
                "var",
                "const",
                "let",
                "CONST"
            ],
            question: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?"
        ),
        (
            correctAnswer: "$_POST",
            options: [
                "_$POST",
                "$POST",
                "$_POST",
                "_$REQUEST['POST']"
            ],
            question: "A variável utilizada no PHP, para acessar o conteúdo de valores de um formulário submetido com o método POST, é:"
        ),
        (
            correctAnswer: "Adicionar propriedades armazenadas",
            options: [
                "Adicionar novas funcionalidades",
                "Definir novos construtores",
                "Adicionar propriedades armazenadas",
                "Adicionar propriedades computadas"
            ],
            question: "O que uma extension não pode fazer?"
        ),
        (
            correctAnswer: "Tem suporte a herança múltipla",
            options: [
                "Tem suporte a herança múltipla",
                "Tem tipagem fraca e dinâmica",
                "Deve ser usada, exclusivamente, para programação web",
                "A tupla é um tipo mutável"
            ],
            question: "Em relação às características da linguagem Python, é correto afirmar que:"
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

