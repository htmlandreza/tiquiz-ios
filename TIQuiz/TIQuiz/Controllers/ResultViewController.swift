//
//  ResultViewController.swift
//  TIQuiz
//
//  Created by Andreza Moreira on 03/06/19.
//  Copyright © 2019 Andreza Moreira. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: Declarações
    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var totalCorrectedAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answeredLabel.text = "Perguntas respondidas: \(totalAnswers)"
        correctLabel.text = "Perguntas corretas: \(totalCorrectedAnswers)"
        wrongLabel.text = "Perguntas erradas: \(totalAnswers - totalCorrectedAnswers)"
        
        let score = totalCorrectedAnswers*100/totalAnswers
        scoreLabel.text = "\(score)%"
    }
    
    // MARK: fechar a tela
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
 

}
