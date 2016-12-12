//
//  ViewController.swift
//  BoutTime
//
//  Created by Cori Mims on 12/5/16.
//  Copyright © 2016 Cori Mims. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabelDown: UIButton!
    @IBOutlet weak var secondLabelUp: UIButton!
    @IBOutlet weak var secondLabelDown: UIButton!
    @IBOutlet weak var thirdLabelUp: UIButton!
    @IBOutlet weak var thirdLabelDown: UIButton!
    @IBOutlet weak var fourthLabelUp: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var instructionLabel: UILabel!
    let game = GameModel()
    let rounds = 6
    var roundsPlayed = 0
    var timer: Timer = Timer()
    var time = 0
    var score = 0
    var correctORder: [EventModel] = []
    var answerArray: [EventModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newRound() {
        if roundsPlayed < rounds {
            startTimer()
            let answerArrray = displayEvents()
            correctORder = game.correctOrder(events: answerArrray)
            updateTimer()
            nextRoundButton.isHidden = true
        } else {
            endGame()
            
        }
    }
    
    func checkRound(checkArray: [EventModel]) {
        if firstLabel.text == correctORder[0].event && secondLabel.text == correctORder[1].event && thirdLabel.text == correctORder[2].event && fourthLabel.text == correctORder[3].event{
            nextRoundButton.setImage(UIImage(named: "next_round_success") , for: .normal)
            nextRoundButton.isHidden = false
            score += 1
            instructionLabel.text = "That's Correct"
        } else {
            instructionLabel.text = "Sorry That's Incorrect"
            nextRoundButton.setImage(UIImage(named: "next_round_fail"), for: .normal)
            nextRoundButton.isHidden = false
        }
    }
    
    func displayEvents () -> [EventModel] {
        instructionLabel.text = "Order the events from old to new."
        let firstEvent = game.getEvent()
        let secondEvent = game.getEvent()
        let thirdEvent = game.getEvent()
        let fourthEvent = game.getEvent()
        
        firstLabel.text = firstEvent.event
        secondLabel.text = secondEvent.event
        thirdLabel.text = thirdEvent.event
        fourthLabel.text = fourthEvent.event
        
        let eventArray = [firstEvent, secondEvent, thirdEvent, fourthEvent]
        
        return eventArray
        
        
    }
    
    @IBAction func switchButton(_ sender: UIButton) {
        switch sender {
        case firstLabelDown: game.switchLabel(labelOne: firstLabel, labelTwo: secondLabel)
        case secondLabelUp: game.switchLabel(labelOne: secondLabel, labelTwo: firstLabel)
        case secondLabelDown: game.switchLabel(labelOne: secondLabel, labelTwo: thirdLabel)
        case thirdLabelUp: game.switchLabel(labelOne: thirdLabel, labelTwo: secondLabel)
        case thirdLabelDown: game.switchLabel(labelOne: thirdLabel, labelTwo: fourthLabel)
        case fourthLabelUp: game.switchLabel(labelOne: fourthLabel, labelTwo: thirdLabel)
        default: print("No selection")
        }
    }

    @IBAction func submitgame(_ sender: Any) {
        if nextRoundButton.image(for: .normal) == UIImage(named: "play_again") {
            instructionLabel.text = ""
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            fourthLabel.isHidden = false
            firstLabelDown.isHidden = false
            secondLabelUp.isHidden = false
            secondLabelDown.isHidden = false
            thirdLabelUp.isHidden = false
            thirdLabelDown.isHidden = false
            fourthLabelUp.isHidden = false
            timerLabel.isHidden = false

            nextRoundButton.isHidden = false
            time = 0
            newRound()
        } else {
        time = 0
        newRound()
        }
    }
    
    func startTimer() {
        //Start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        //Update the timer label
        time += 1
        timerLabel.text = String(60 - time)
        
        if time == 60 {
            //TIMES UP! Invalidate the timer and make the round end
            timer.invalidate()
            endRound()
            
        }
    }
    
    func endRound() {
        checkRound(checkArray: correctORder)
        timerLabel.text = "TIMES UP!"
        roundsPlayed += 1
    }
    
    func endGame() {
        firstLabel.isHidden = true
        secondLabel.isHidden = true
        thirdLabel.isHidden = true
        fourthLabel.isHidden = true
        firstLabelDown.isHidden = true
        secondLabelUp.isHidden = true
        secondLabelDown.isHidden = true
        thirdLabelUp.isHidden = true
        thirdLabelDown.isHidden = true
        fourthLabelUp.isHidden = true
        timerLabel.isHidden = true
        
        nextRoundButton.setImage(UIImage(named: "play_again"), for: .normal)
        instructionLabel.text = "You won \(score) out of \(rounds) rounds"
        
        game.removeEvents()
        roundsPlayed = 0
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        //Test for shaking of device, stop timer and end the round
        if motion == .motionShake {
            timer.invalidate()
            endRound()
        }
    }
}


