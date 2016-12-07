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
    
    let game = GameModel()
    let rounds = 6
    var roundsPlayed = 0
    var timer: Timer = Timer()
    var time = 0
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
        if roundsPlayed <= rounds {
            startTimer()
            let answerArrray = displayEvents()
            correctORder = game.correctOrder(events: answerArrray)
            updateTimer()
            nextRoundButton.isHidden = true
        }
    }
    
    func checkRound(checkArray: [EventModel]) {
        if firstLabel.text == correctORder[0].event && secondLabel.text == correctORder[1].event && thirdLabel.text == correctORder[2].event && fourthLabel.text == correctORder[3].event{
            nextRoundButton.setImage(UIImage(named: "next_round_success") , for: .normal)
            nextRoundButton.isHidden = false
        } else {
            nextRoundButton.setImage(UIImage(named: "next_round_fail"), for: .normal)
            nextRoundButton.isHidden = false
        }
    }
    
    func displayEvents () -> [EventModel] {
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
        time = 0
        newRound()
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
        timerLabel.text = "\(correctORder[2].event) \(correctORder[3].event)"
        roundsPlayed += 1
    }
}

