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
    let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
    let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in
            return pair1.value > pair2.value
        })
         
        let mostCommonAnswer = frequentAnswersSorted.sorted { $0.1 > $1.1}.first!.key
    
        resultsAnswerLabel.text = "Results"
        resultsResponse.text = mostCommonAnswer.definition
        
  }
}
