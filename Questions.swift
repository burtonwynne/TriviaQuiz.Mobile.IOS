//
//  Questions.swift
//  TriviaQuiz
//
//  Created by Burton Wynne on 7/13/16.
//  Copyright © 2016 Burton Wynne. All rights reserved.
//

import Foundation

class Question {
    private var question:String
    private var correctAnswer:Int
    
    private var choices:[String]
    
    init(){
        choices = [String]()
        correctAnswer = Int()
        question = String()
    }
    
    convenience init(question:String, choices:[String], correctAnswer:Int){
        self.init()
        self.question = question
        self.choices = choices
        self.correctAnswer = correctAnswer
    }
    
    func isCorrect(input:Int) -> Bool {
        return input == correctAnswer
    }
    
    func getChoices() -> [String] {
        return choices
    }
    
    func getCount() -> Int {
        return choices.count
    }
    
    func getQuestion() -> String {
        return question
    }
}
