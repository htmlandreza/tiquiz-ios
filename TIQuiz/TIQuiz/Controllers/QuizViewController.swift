//
//  QuizViewController.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: Declarações
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: esse método é chamado toda vez que essa tela for aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: fazendo a barra do timer
        // definindo que a largura do timer é a largura da tela
        timerView.frame.size.width = view.frame.size.width
   
        // MARK: método para animar um elemento
        // TODO: depois alterar o tempo de duração
        UIView.animate(withDuration: 30.0, delay: 0, options: .curveLinear, animations: {
            // código do que irá se animar
            // MARK: quando o tempo terminar, o tamanho do timer deve ser igual a 0
            self.timerView.frame.size.width = 0
        }) {
            // MARK: se tudo der certo, chama o método showResults
            (success) in
            self.showResults()
        }
        // MARK: chama um novo quiz
        getNewQuiz()
    }
    
    // MARK: gera um novo quiz
    func getNewQuiz(){
        quizManager.refreshQuiz()
        
        // MARK: implementando botões
        questionLabel.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = answersButton[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    // MARK: mostrar o resultado depois que acabar o tempo
    func showResults(){
        // chamando segue
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }   
    
    // MARK: passar valores(dados) para outra tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectedAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        // MARK: indice do botão clicado
        let index = answersButton.index(of: sender)!
        // MARK: validar resposta passando o indice
        quizManager.validateAnswer(index: index)
        // pede um novo quiz
        getNewQuiz()
    }
    
}
