//
//  ViewController.swift
//  Class-ification Teacher
//
//  Created by Diego on 5/1/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var challengePrize: UITextField!
    @IBOutlet weak var challengeCost: UITextField!
    
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answerA: UITextField!
    @IBOutlet weak var answerB: UITextField!
    @IBOutlet weak var answerC: UITextField!
    @IBOutlet weak var answerD: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func throwChallengeButtonPressed(sender: AnyObject)
    {
        endEditing()
        
        system.throwChallengeWithCost(challengeCost.text.toInt()!, prize: challengePrize.text.toInt()!)
    }
    
    @IBAction func throwQuestionButtonPressed(sender: AnyObject)
    {
        endEditing()
        
        system.throwQuestionWithQuestion(question.text, answers: [answerA.text, answerB.text, answerC.text, answerD.text])
    }
    
    func endEditing()
    {
        challengeCost.endEditing(true)
        challengePrize.endEditing(true)
        
        question.endEditing(true)
        answerA.endEditing(true)
        answerB.endEditing(true)
        answerC.endEditing(true)
        answerD.endEditing(true)
    }
}

