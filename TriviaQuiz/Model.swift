//
//  Model.swift
//  TriviaQuiz
//
//  Created by Burton Wynne on 7/13/16.
//  Copyright © 2016 Burton Wynne. All rights reserved.
//

import Foundation

class Model {
    private var questiongenerator:QuestionGenerator
    
    init(){
        questiongenerator = QuestionGenerator()
        
        
        print("Loading...")
        self.load()
        print("Loaded")
        
    }
    
    func isCorrect(answer:Int) -> Bool {
        return getCurrentQuestion().isCorrect(answer)
    }
    
    func getNextQuestion() -> Question? {
        return questiongenerator.getNextQuestion()
    }
    
    func getCurrentQuestion() -> Question {
        return questiongenerator.getCurrentQuestion()
    }
    
    func getQuestionCount() -> Int {
        return questiongenerator.questionsList.count
    }
    
    func load() -> Void {
        let scriptUrl = "http://localhost:5000/quiz"
        // Add one parameter
        let urlWithParams = scriptUrl + "?userName=Chameleon)"
        
        let myUrl = NSURL(string: urlWithParams);
        
        // Creaste URL Request
        let request = NSMutableURLRequest(URL:myUrl!);
        
        // Set request HTTP method to GET. It could be POST as well
        request.HTTPMethod = "GET"
    
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Convert server json response to NSDictionary
            do {
                let datastring:String = String(data: data!, encoding: NSUTF8StringEncoding)!
                print("Data:\n\t\(datastring)")
                
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    
                    let questions = convertedJsonIntoDict.valueForKey("questions") as! [NSDictionary]
                    
                    for question:NSDictionary in questions {
                        self.questiongenerator.addQuestion(
                            Question(
                                question: (question.valueForKey("question") as? String)!,
                                choices: (question.valueForKey("choices") as? [String])!,
                                correctAnswer: (question.valueForKey("correctAnswer") as? Int!)!
                        ))
                    }                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    
}

