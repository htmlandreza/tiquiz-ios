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
    
    // FIX-ME: pegar dados direto do firebase
    /*
    func carregaQuizDev(){
        let headers = [
            "cache-control": "no-cache",
            "Postman-Token": "ccae5776-8c0d-4746-9e50-91dfd89e9b9f"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tiquiz.firebaseio.com/quizes/dev.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse.debugDescription)
                
                if let httpStatus = response as? HTTPURLResponse{
                    // retorno da requisição com todos os parâmetros tratados do usuário identificado
                    if httpStatus.statusCode == 200 {
                        print("Status Code da UsersTableViewController = \(httpStatus.statusCode)")
                        
                        do {
                            if let data = data{
                                self.quizesDev = try! JSONDecoder().decode([QuizDev].self, from: data)
                                print (self.quizesDev)
                                
                            }
                            
                        } catch let parseError as NSError {
                            print("Error with Json: \(parseError)")
                        }
                    }
                }
            })
            
            dataTask.resume()
        }
        
        // MARK: esse método é chamado toda vez que essa tela for aparecer
        func viewWillAppear(_ animated: Bool) {
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
            getNewQuiz()
        }
 */
    
}
