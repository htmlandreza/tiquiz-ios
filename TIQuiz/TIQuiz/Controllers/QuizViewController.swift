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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
    }
    
}
