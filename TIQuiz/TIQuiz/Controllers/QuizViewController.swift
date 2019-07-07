//
//  QuizViewController.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class QuizViewController: UIViewController {
    
    var quizes: [QuizesFirebase] = []
  
    var ref:DatabaseReference!
    var handle: DatabaseHandle!
    
    var myQuizes: [String] = []
    

    // MARK: Declarações
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregaDados()
    }
    
    
    
    // MARK: esse método é chamado toda vez que essa tela for aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: não está funcionando o timer
        // definindo que a largura do timer é a largura da tela
        timerView.frame.size.width = view.frame.size.width
   
        // MARK: método para animar um elemento
        // TODO: depois alterar o tempo de duração
        UIView.animate(withDuration: 20.0, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        // MARK: chama um novo quiz
        self.getNewQuiz()
        
        
    }
    
    // Busca dados do Firebase
    func carregaDados(){
        let headers = [
            "cache-control": "no-cache",
            "Postman-Token": "da46e0ea-fe09-4880-ac3b-b5755648d39f"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tiquiz.firebaseio.com/quizes/bancodedados.json")! as URL,
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
                    if let httpStatus = response as? HTTPURLResponse{
                        print("Status Code da UsersTableViewController = \(httpStatus.statusCode)")
                        do {
                            if let data = data{
                                self.quizes = try JSONDecoder().decode([QuizesFirebase].self, from: data)
                                print (self.quizes)
                                
                            }
                        } catch let parseError as NSError {
                            print("Error with Json: \(parseError)")
                        }
                    }
            }
        })
        
        dataTask.resume()
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
