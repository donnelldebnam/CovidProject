//
//  Question.swift
//  CovidProject
//
//  Created by leslie jaiyesimi on 4/11/21.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}


enum ResponseType {
    case single, multiple, single1, single2
}

struct Answer {
    var text: String
    var type: AnswerType
    
}

enum AnswerType: String {
    case yes = "Yes", no = "No"

var definition: String {
    switch self {
    case .yes:
        return " Your answers deem that you should schedule for a covid test."
        
    case .no:
        return "Your answers deem that you do not need to schedule for a covid test."
    }
  }
}
