//
//  ResultsViewController.swift
//  CovidProject
//
//  Created by leslie jaiyesimi on 4/12/21.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultsAnswerLabel: UILabel!
    @IBOutlet var resultsResponse: UILabel!
    
    var responses: [Answer]

    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
        resultsAnswerLabel.text = "Results"
        resultsResponse.text = mostCommonAnswer.definition
    }
    
    @IBAction func locationButtonpressed(_ sender: UIButton) {
        performSegue(withIdentifier: "location", sender: nil)
    }
   
    
}

