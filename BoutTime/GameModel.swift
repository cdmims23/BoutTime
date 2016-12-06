//
//  GameModel.swift
//  BoutTime
//
//  Created by Cori Mims on 12/5/16.
//  Copyright © 2016 Cori Mims. All rights reserved.
//

import Foundation
import GameKit
import UIKit

class GameModel {
    let events: [EventModel] = [EventModel(event: "First breakfast cereal invented", eventYear: 1863, eventURL: ""), EventModel(event: "Kodak debuts the first dollar box camera", eventYear: 1900, eventURL: ""), EventModel(event: "First radio program broadcast", eventYear: 1906, eventURL: ""), EventModel(event: "World War I begins", eventYear: 1914, eventURL: "")]
    
    init() {
    }
    
    func randomEvent() -> Int {
        var numberHolder: [Int] = []
        var diffNumber: Bool = false
        var randomNumber = 0
        
        while diffNumber == false {
             randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
            if numberHolder.contains(randomNumber) {
                diffNumber = false
            } else {
                diffNumber = true
                numberHolder.append(randomNumber)
            }
        }
        return randomNumber
    }
    
    func getEvent(firstLabel: UILabel, secondLabel: UILabel, thirdLabel: UILabel, fourthLabel: UILabel) {
        firstLabel.text = events[randomEvent()].event
        secondLabel.text = events[randomEvent()].event
        thirdLabel.text = events[randomEvent()].event
        fourthLabel.text = events[randomEvent()].event
        
    }
}










































