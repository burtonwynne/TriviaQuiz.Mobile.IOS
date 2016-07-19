//
//  QuestionsGenerator.swift
//  TriviaQuiz
//
//  Created by Burton Wynne on 7/13/16.
//  Copyright © 2016 Burton Wynne. All rights reserved.
//

import Foundation
import UIKit

class QuestionGenerator {
    var questionsList: [Question]
    var counter: Int
    var currentQuestion :Question
    
    init(){
        questionsList = [Question]()
        counter = Int()
        currentQuestion = Question()
    }
    
    func addQuestion(question:Question){
        questionsList.append(question)
    }
    
    
    func getNextQuestion()  -> Question?{
        if !questionsList.isEmpty {
            counter += 1
            if counter < questionsList.count {
                self.currentQuestion = questionsList[counter]
            } else {
                //counter = 0;
                //self.currentQuestion = questionsList[counter]
            }
        }
        return currentQuestion
    }
    
    func getCurrentQuestion() -> Question{
        if counter < questionsList.count {
            return questionsList[counter];
        }else{
            return questionsList[0];
        }
    }
    
    func availableQuestions() -> Bool {
        return counter < questionsList.count
    }
}
