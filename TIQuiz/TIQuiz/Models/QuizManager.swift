//
//  QuizManager.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import Foundation

class QuizManager{
    // TODO: implementar no firebase
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (question: "Segundo o PMBOK, são stakeholders de um projeto:", correctAnswer: "Gerente do Projeto. Patrocinador do Projeto. Cliente, Diretoria. Gerente Executivo. Gerentes de Departamento. Fornecedores. Distribuidores.",
         options: ["Gerente do Projeto. Analista do Projeto. Cliente. Programa de Treinamento. Assessoria. Gerentes de Conta. Fornecedores Concorrentes. Mantenedores.",
                   "Pool de Programação. Controlador do Projeto. Servidores. Diretoria. Gerente Executivo. Gerentes de Operações. Entidades Externas. Webmasters.",
                   "Gerente do Projeto. Patrocinador do Projeto. Cliente, Diretoria. Gerente Executivo. Gerentes de Departamento. Fornecedores. Distribuidores.",
                   "Gerente do Projeto. Estratégias. Logística. Diretoria. Escritório de Projetos. Gerentes de Contingência. Fornecedores. Distribuidores."]),
        
        (question: "Qual é o resultado da expressão \"1\" + \"1\"", correctAnswer: "\"11\"",
         options: ["11",
                   "\"2\"",
                   "\"11\"",
                   "\"1 1\""]),
        
        (question: "Qual desses símbolos é usado para \"escapar\" caracteres especiais", correctAnswer: "\\",
         options: ["/",
                   "\\",
                   "!",
                   "ESC"]),
        
        (question: "Segundo o PMBOK, o resultado “Atualizações do registro dos riscos” NÃO é uma saída do processo:", correctAnswer: "Identificar os riscos",
         options: ["Planejar as respostas aos riscos",
                   "Realizar a análise qualitativa dos riscos",
                   "Monitorar e controlar os riscos",
                   "Identificar os riscos"]),
        
        (question:
            """
               func printSomething() {
                  print("Adoro funções")
               }
               printSomething()
            """, correctAnswer: "Adoro funções",
                 options: ["Nada",
                           "printSomething()",
                           "Adoro funções",
                           "Erro"]),
        
        (question: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?", correctAnswer: "Void",
         options: ["Void",
                   "Int",
                   "String",
                   "nil"]),
        
        (question: "Em CSS, uma folha de estilo é dita incorporada ou interna quando as regras CSS estão declaradas:", correctAnswer: "No próprio documento HTML, e são válidas tão somente para aquele documento específico",
         options: ["Em um documento, à parte do documento HTML",
                   "No próprio documento HTML, e são válidas tão somente para aquele documento específico",
                   "Dentro da “Tag” do elemento HTML",
                   "Em um mesmo elemento, em folhas de estilos diferentes"]),
        
        (question: "Qual é o tipo de uma variavél String que pode aceitar nil?", correctAnswer: "String?",
         options: ["String",
                   "String?",
                   "Int",
                   "Void"]),
        
        (question: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?", correctAnswer: "let",
         options: ["var",
                   "const",
                   "let",
                   "CONST"]),
        
        (question: "O que é um dicionário?", correctAnswer: "É uma coleção não-ordenada com chave e valor",
         options: ["É uma coleção que não aceita objetos repetidos",
                   "É uma coleção ordenada com chave e valor",
                   "É uma coleção não-ordenada com chave e valor",
                   "É uma coleção que permite valores de tipos diferentes"]),
        
        (question: "A variável utilizada no PHP, para acessar o conteúdo de valores de um formulário submetido com o método POST, é:", correctAnswer: "$_POST",
         options: ["_$POST", "$POST", "$_POST", "_$REQUEST['POST']"]),
        
        (question: "O que é um enum?", correctAnswer: "Tipo definido pelo usuário para um grupo de valores relacionados",
         options: ["É um conjunto de Strings",
                   "É um tipo especial de String",
                   "É um operador unário do tipo prefix",
                   "Tipo definido pelo usuário para um grupo de valores relacionados"]),
        
        (question: "O que uma extension não pode fazer?", correctAnswer: "Adicionar propriedades armazenadas",
         options: ["Adicionar novas funcionalidades",
                   "Definir novos construtores",
                   "Adicionar propriedades armazenadas",
                   "Adicionar propriedades computadas"]),
        
        (question: "Em relação às características da linguagem Python, é correto afirmar que:", correctAnswer: "Tem suporte a herança múltipla",
         options: ["Tem suporte a herança múltipla",
                   "Tem tipagem fraca e dinâmica",
                   "Deve ser usada, exclusivamente, para programação web",
                   "A tupla é um tipo mutável"]),
        
        (question: "Em relação ao INNER JOIN, é correto afirma que:", correctAnswer: "É possível fazer um INNER JOIN de uma tabela para ela mesma",
         options: ["Somente os registros da tabela à esquerda do relacionamento INNER JOIN serão retornados",
                   "É possível retornar todos os registros de todas as tabelas sem nenhuma restrição",
                   "É possível fazer um INNER JOIN de uma tabela para ela mesma",
                   "Somente os registros da tabela à direita do relacionamento INNER JOIN serão retornados"]),
        
        (question: "Considerando-se os diversos tipos de diagramas UML, marque a opção que representa apenas diagramas estruturais.", correctAnswer: "Objetos, componentes, pacotes e instalação",
         options: ["Classe, atividade, objetos e instalação",
                   "Objetos, componentes, pacotes e instalaçãocc",
                   "Objetos, componentes, caso de uso e estados",
                   "Classe, objetos, sequência e caso de uso"]),
        
        (question: "No Linux e no prompt de comandos do Windows, para mostrar a lista de arquivos e diretórios presentes na unidade de armazenamento atual, por exemplo, um pen drive, utilizam-se, respectivamente, os comandos", correctAnswer: "ls e dir",
         options: ["ls e dir",
                   "list e mkdir",
                   "cat e rmdir",
                   "ps e dir"]),
        
        (question: "Embora os discos rígidos (HD) sejam ainda muito utilizados, as unidades de estado sólido (SSD) vêm cada vez mais sendo utilizadas. Comparando os HDs convencionais com os SSDs, tem-se que", correctAnswer: "Os SSDs são mais resistentes do que os HDs em relação a movimentos, quedas ou interferências magnéticas",
         options: ["A vida útil dos SSDs é maior do que a dos HDs",
                   "O consumo dos SSDs é maior do que o dos HDs",
                   "O preço por bit de armazenamento dos SSDs é menor do que o dos HD",
                   "Os SSDs são mais resistentes do que os HDs em relação a movimentos, quedas ou interferências magnéticas"]),
        
//        (question: "aaaaa", correctAnswer: "bbb",
//         options: ["bbb",
//                   "ccc",
//                   "ccc",
//                   "ccc"]),
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

