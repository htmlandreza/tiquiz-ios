//
//  QuizManager.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

class GestaoManager{
    // TODO: implementar no firebase
    private let quizes: [(question: String, correctAnswer: String, options: [String])] =
        [
            (
                correctAnswer: "Identificar os riscos",
                options: [
                    "Planejar as respostas aos riscos",
                    "Realizar a análise qualitativa dos riscos",
                    "Monitorar e controlar os riscos",
                    "Identificar os riscos"
                ],
                question: "Segundo o PMBOK, o resultado “Atualizações do registro dos riscos” NÃO é uma saída do processo:"
            ),
            (
                correctAnswer: "Gerente do Projeto. Patrocinador do Projeto. Cliente, Diretoria. Gerente Executivo. Gerentes de Departamento. Fornecedores. Distribuidores.",
                options: [
                    "Gerente do Projeto. Analista do Projeto. Cliente. Programa de Treinamento. Assessoria. Gerentes de Conta. Fornecedores Concorrentes. Mantenedores.",
                    "Pool de Programação. Controlador do Projeto. Servidores. Diretoria. Gerente Executivo. Gerentes de Operações. Entidades Externas. Webmasters.",
                    "Gerente do Projeto. Patrocinador do Projeto. Cliente, Diretoria. Gerente Executivo. Gerentes de Departamento. Fornecedores. Distribuidores.",
                    "Gerente do Projeto. Estratégias. Logística. Diretoria. Escritório de Projetos. Gerentes de Contingência. Fornecedores. Distribuidores."
                ],
                question: "Segundo o PMBOK, são stakeholders de um projeto:"
            ),
            (
                correctAnswer: "Produtos, serviços ou resultados verificáveis devem ser usados como componentes da EAP.",
                options: [
                    "A EAP deve ter sempre a mesma profundidade em todos seus ramos, para manter os pacotes de trabalho no mesmo nível de abstração.",
                    "Os  entregáveis não devem ser representados na EAP, que deve ser em fases do ciclo de vida do projeto.",
                    "Produtos, serviços ou resultados verificáveis devem ser usados como componentes da EAP.",
                    "Os subprojetos contratados devem ficar fora da EAP, pois não representam o trabalho da equipe."
                ],
                question: "Foi solicitada a um gerente de projeto a descrição parcial de um projeto de desenvolvimento de software usando a metodologia conhecida como Estrutura Analítica de Projeto (EAP). Para a realização eficaz dessa tarefa, o gerente deve considerar que:"
            ),
            (
                correctAnswer: "Planejamento",
                options: [
                    "Iniciação",
                    "Planejamento",
                    "Integração",
                    "Escopo"
                ],
                question: "O Termo de Abertura do Projeto é a saída do processo Desenvolver o termo de abertura do projeto, que está vinculado no PMBOK à uma área de conhecimento denominada:"
            ),
            (
                correctAnswer: "Ciclo de vida do projeto",
                options: [
                    "Análise de passagem.",
                    "Saída de fase",
                    "Passagem de estágio",
                    "Ciclo de vida do projeto"
                ],
                question: "O conjunto de fases coletivas atravessadas pelo projeto é denominado:"
            ),
            (
                correctAnswer: "O custo das máquinas e dos equipamentos necessários para a execução do projeto",
                options: [
                    "Prazo do projeto",
                    "O custo das máquinas e dos equipamentos necessários para a execução do projeto",
                    "Se as pessoas estão motivadas com o projeto",
                    "O número de fornecedores"
                ],
                question: "Carla, patrocinadora do projeto, solicita uma reunião ao Alexandre, gerente do projeto, para verificar o andamento. Alexandre se reúne com sua equipe e solicita uma série de informações. Quais informações terão maior relevância para o patrocinador?"
            ),
            (
                correctAnswer: "Conflito e competição",
                options: [
                    "Frustração",
                    "Falta de confiança no gerente do projeto",
                    "Reuniões improdutivas",
                    "Conflito e competição"
                ],
                question: "Dentre as opções abaixo, qual a que menos pode ser considerada um sintoma de que a equipe do projeto não está trabalhando efetivamente como um time?"
            ),
            (
                correctAnswer: "Pelo time do projeto",
                options: [
                    "Por um comitê das partes interessadas",
                    "Pelo gerente do projeto",
                    "Pelo time do projeto",
                    "Pelo dirigente da organização"
                ],
                question: "Segundo o Guia PMBOK, o Plano do Projeto deve ser desenvolvido:"
            ),
            (
                correctAnswer: "Criar a EAP",
                options: [
                    "Criar a EAP",
                    "Sequenciar as Atividades",
                    "Controlar os Custos",
                    "Desenvolver o Plano de Gerenciamento do Projeto"
                ],
                question: "De acordo com o PMBoK, a Área de Conhecimento Gerenciamento do Escopo do Projeto possui os processos: Coletar os Requisitos, Denir o Escopo, Vericar o Escopo, Controlar o Escopo e:"
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

