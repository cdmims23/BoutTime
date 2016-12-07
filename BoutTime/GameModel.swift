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
    let events: [EventModel] = [EventModel(event: "First breakfast cereal invented", eventYear: 1863, eventURL: ""), EventModel(event: "Kodak debuts the first dollar box camera", eventYear: 1900, eventURL: ""), EventModel(event: "First radio program broadcast", eventYear: 1906, eventURL: ""), EventModel(event: "World War I begins", eventYear: 1914, eventURL: ""), EventModel(event: "First self serve grocerie store", eventYear: 1916, eventURL: ""), EventModel(event: "Creation of NHL", eventYear: 1917, eventURL: ""), EventModel(event: "World War I Ends", eventYear: 1918, eventURL: ""), EventModel(event: "Walt Disney Company formed", eventYear: 1922, eventURL: ""), EventModel(event: "Founding of Time Magazine", eventYear: 1923, eventURL: ""), EventModel(event: "First Winter Olympics", eventYear: 1924, eventURL: ""), EventModel(event: "Mussolini becomes dictator of Italy", eventYear: 1925, eventURL: ""), EventModel(event: "Stalin becomes leader of the Soviet Union", eventYear: 1927, eventURL: ""), EventModel(event: "Discovery of penicilin", eventYear: 1928, eventURL: ""), EventModel(event: "Crash of Wall St.", eventYear: 1929, eventURL: ""), EventModel(event: "The Twinkie is invented", eventYear: 1930, eventURL: "")]
    
    var numbers: [Int] = []
    
    init() {
        
    }
    
    func generateRandomNumber() -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        return randomNumber
    }
    
    func checkRandom() -> Int {
        var numberExists: Bool = true
        var randomNumber = generateRandomNumber()
        
        while numberExists == true {
            if numbers.contains(randomNumber){
            randomNumber = generateRandomNumber()
            } else {
                numberExists = false
            }
        }
        numbers.append(randomNumber)
        
        return randomNumber
    }
    
    func getEvent() -> EventModel {
        let number = checkRandom()
        
        return events[number]
    }
    
    func correctOrder(events: [EventModel]) -> [EventModel] {
        
       return events.sorted(by: {$0.eventYear < $1.eventYear})

    }
    
    func switchLabel(labelOne: UILabel, labelTwo: UILabel) {
        let textOne = labelOne.text
        let textTwo = labelTwo.text
        
        // Switch Label Text
        labelOne.text = textTwo
        labelTwo.text = textOne
    }
    
    
}












































