//
//  GestaoProjetoViewController.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 07/07/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import UIKit

class GestaoProjetoViewController: UIViewController {
    // MARK: Declarações
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    
    var gestaoManager = GestaoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: esse método é chamado toda vez que essa tela for aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: não está funcionando o timer
        // definindo que a largura do timer é a largura da tela
        timerView.frame.size.width = view.frame.size.width
        
        // MARK: método para animar um elemento
        // TODO: depois alterar o tempo de duração
        UIView.animate(withDuration: 30.0, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        // MARK: chama um novo quiz
        self.getNewQuiz()
    }
    
    // MARK: gera um novo quiz
    func getNewQuiz(){
        gestaoManager.refreshQuiz()
        
        // MARK: implementando botões
        questionLabel.text = gestaoManager.question
        for i in 0..<gestaoManager.options.count {
            let option = gestaoManager.options[i]
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
        resultViewController.totalAnswers = gestaoManager.totalAnswers
        resultViewController.totalCorrectedAnswers = gestaoManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        // MARK: indice do botão clicado
        let index = answersButton.index(of: sender)!
        
        // MARK: validar resposta passando o indice
        gestaoManager.validateAnswer(index: index)
        
        // pede um novo quiz
        getNewQuiz()
    }
    
}
