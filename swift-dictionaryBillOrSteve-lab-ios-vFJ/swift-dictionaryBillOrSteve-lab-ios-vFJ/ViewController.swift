    //
//  ViewController.swift
//  swift-dictionaryBillOrSteve-lab-ios-vFJ
//
//  Created by Felicity Johnson on 9/23/16.
//  Copyright © 2016 FJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var rightOrWrongLabel: UILabel!
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var billLabel: UIButton!
    
    @IBOutlet weak var steveLabel: UIButton!
    
    var correctPerson: String = ""
    var guessedPerson: String = ""
    var score: Int = 0
    var numTries: Int = 0
    
    @IBAction func playAgain(sender: AnyObject) {
        
        if numTries < 9 {
            createFacts()
            showFact()
            rightOrWrongLabel.text = ""
            
        } else {
            
            rightOrWrongLabel.text = "Game Over!"
        }
        
        
    }
    
    
    
    @IBAction func steveButton(sender: AnyObject) {
        
        guessedPerson = "Steve Jobs"
        numTries = numTries + 1
        print(numTries)
        
        if correctPerson == guessedPerson {
            
            rightOrWrongLabel.text = "You are correct!"
            score = score + 1
            scoreLabel.text = String(score)
           
            
        } else {
            
            rightOrWrongLabel.text = "try again"
            
        }
        
    }
    
    
    @IBAction func billAction(sender: AnyObject) {
        
        guessedPerson = "Bill Gates"
        numTries = numTries + 1
        print(numTries)
        
        if correctPerson == guessedPerson {
            
            rightOrWrongLabel.text = "You are correct!"
            score = score + 1
            scoreLabel.text = String(score)
            
            
        } else {
            
            rightOrWrongLabel.text = "try again"
            
        }
    }
    
    
    func showFact() {
        
        let result = getRandomFacts()
        factLabel.text = result
        
    }
    
    
    var billAndSteveFunFacts : [String : [String]] = [:]
    var steveFacts : [String] = []
    var billFacts : [String] = []
    
    func createFacts() {
        
            billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
            steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFunFacts["Bill Gates"] = billFacts
        billAndSteveFunFacts["Steve Jobs"] = steveFacts
        
    }
    
    
    func getRandomFacts() -> (String){
        
        var itemToReturn = ""
        var nameToReturn = ""
        
        if randomPerson() == "Steve Jobs" {
            
            let indexToSearch = randomIndex(fromArray: steveFacts)
            print("Index : \(indexToSearch)")
            
                itemToReturn = steveFacts[indexToSearch]
                nameToReturn = "Steve Jobs"
                correctPerson = nameToReturn
            
        } else if randomPerson() == "Bill Gates" {
                
                let indexToSearch = randomIndex(fromArray: billFacts)
                print("Index : \(indexToSearch)")
                
                    itemToReturn = billFacts[indexToSearch]
                    nameToReturn = "Bill Gates"
                    correctPerson = nameToReturn
            }
            
        return ("\(itemToReturn)")
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
        
    }

    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }


}

