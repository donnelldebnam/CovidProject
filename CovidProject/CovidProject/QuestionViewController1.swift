//
//  QuestionViewController1.swift
//  CovidProject
//
//  Created by leslie jaiyesimi on 4/12/21.
//

import Foundation
import UIKit

class QuestionViewController1: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var last14daysView: UIStackView!
    @IBOutlet var yesbutton: UIButton!
    @IBOutlet var nobutton: UIButton!
    
    
    @IBOutlet var symptomsView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiLabel5: UILabel!
    @IBOutlet var multiLabel6: UILabel!
    @IBOutlet var multiLabel7: UILabel!
    @IBOutlet var multiLabel8: UILabel!
    

    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    @IBOutlet var multiSwitch5: UISwitch!
    @IBOutlet var multiSwitch6: UISwitch!
    @IBOutlet var multiSwitch7: UISwitch!
    @IBOutlet var multiSwitch8: UISwitch!
    
    @IBOutlet var residentView: UIStackView!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    @IBOutlet var workplaceView: UIStackView!
    @IBOutlet var workyesButton: UIButton!
    @IBOutlet var worknoButton: UIButton!
    
    @IBOutlet var questionProgressView: UIProgressView!
        
    var questions: [Question] = [
    Question(
        text: "Have you been around someone who has had covid in the last 14 days?",
        type: .single,
        answers:[
        Answer(text: "Yes", type: .yes),
        Answer(text: "No", type: .no)
        ]
    ),
    Question (
        text: "Have you experienced any of these symptoms?",
        type: .multiple,
        answers: [
        Answer(text: "Chills", type: .yes),
        Answer(text: "Headache", type: .yes),
        Answer(text: "Body Aches", type: .yes),
        Answer(text: "Diarrhea", type: .yes),
        Answer(text: "Fever", type: .yes),
        Answer(text: "Loss of Taste", type: .yes),
        Answer(text: "Shortness of Breath", type: .yes),
        Answer(text: "None of the Above", type: .no)
    ]
),
    Question(
        text: "Are you a resident in a special setting where the risk of covid - 19 transmission may be high?",
        type: .single1,
        answers:[
        Answer(text: "Yes", type: .yes),
        Answer(text: "No", type: .no)
    ]
 ),
    
    Question (
    text: "Do you work in a special setting where the risk of Covid - 19 transmission may be high?",
    type: .single2,
    answers:[
        Answer(text: "Yes", type: .yes),
        Answer(text: "No", type: .no)
        ])
    
]
    
    
var questionIndex = 0
var answersChosen: [Answer] = []
    
override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
    
    func updateUI() {
        last14daysView.isHidden = true
        symptomsView.isHidden = true
        residentView.isHidden = true
        workplaceView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Covid Quiz"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            update14daysView(using: currentAnswers)
        case .multiple:
            updateSymptomsView(using: currentAnswers)
        case .single1:
            updateResidentView(using: currentAnswers)
        case .single2:
            updateWorkPlaceView(using: currentAnswers)
            
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
            
        if questionIndex < questions.count {
            updateUI()
        } else {
          performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    func update14daysView(using answers: [Answer]){
        last14daysView.isHidden = false
        yesbutton.setTitle(answers[0].text, for: .normal)
        nobutton.setTitle(answers[1].text, for: .normal)
    }
    
    func updateSymptomsView(using answers: [Answer]){
        symptomsView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiSwitch5.isOn = false
        multiSwitch6.isOn = false
        multiSwitch7.isOn = false
        multiSwitch8.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        multiLabel5.text = answers[4].text
        multiLabel6.text = answers[5].text
        multiLabel7.text = answers[6].text
        multiLabel8.text = answers[7].text
    }
    
    func updateResidentView(using answers: [Answer]){
        residentView.isHidden = false
        yesButton.setTitle(answers[0].text, for: .normal)
        noButton.setTitle(answers[1].text, for: .normal)
    }
    
    func updateWorkPlaceView(using answers: [Answer]){
        workplaceView.isHidden = false
        workyesButton.setTitle(answers[0].text, for: .normal)
        worknoButton.setTitle(answers[1].text, for: .normal)
    }
    
    @IBAction func daysAnswerButton(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case yesbutton:
            answersChosen.append(currentAnswers[0])
        case nobutton:
            answersChosen.append(currentAnswers[1])
        default:
            break
        }
   
    nextQuestion()
        
    }
    
    @IBAction func symptomsButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if multiSwitch5.isOn {
            answersChosen.append(currentAnswers[4])
        }
        if multiSwitch6.isOn {
            answersChosen.append(currentAnswers[5])
        }
        if multiSwitch7.isOn {
            answersChosen.append(currentAnswers[6])
        }
        if multiSwitch8.isOn {
            answersChosen.append(currentAnswers[7])
        }
      
        nextQuestion()
        
    }
    
    @IBAction func residentButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
       
        switch sender {
        case yesButton:
            answersChosen.append(currentAnswers[0])
        case noButton:
            answersChosen.append(currentAnswers[1])
        default:
            break
        }
    
       nextQuestion()
        
    }
    
    @IBAction func workplaceButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case workyesButton:
            answersChosen.append(currentAnswers[0])
        case worknoButton:
            answersChosen.append(currentAnswers[1])
        default:
            break
        }
    
    nextQuestion()
    
}


    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
}

