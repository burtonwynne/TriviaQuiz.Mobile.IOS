//
//  ViewController.swift
//  TriviaQuiz
//
//  Created by Burton Wynne on 7/13/16.
//  Copyright © 2016 Burton Wynne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choicesTable: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var model:Model = Model()
    var score:Int = 0
    var answered:Int = 0
    var currentQuestion:Question = Question()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        while model.getQuestionCount() == 0 {
            sleep(1)
        }
        self.choicesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        currentQuestion = model.getCurrentQuestion()
        loadQuestion()
    }
    
    func loadQuestion() {
        

        self.questionLabel.text = currentQuestion.getQuestion()
        self.scoreLabel.text = "Score: \(score) out of \(answered) correct."
        self.choicesTable.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCurrentQuestion().getCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.choicesTable!.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = model.getCurrentQuestion().getChoices()[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.answered += 1
        
        if model.getCurrentQuestion().isCorrect(indexPath.row) {
            self.score += 1
        }else{
            //score -= 1
        }
        
        currentQuestion = model.getNextQuestion()!
        loadQuestion()
        
    }



}

