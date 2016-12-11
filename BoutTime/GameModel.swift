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
    let events: [EventModel] = [EventModel(event: "First breakfast cereal invented", eventYear: 1863, eventURL: ""), EventModel(event: "Kodak debuts the first dollar box camera", eventYear: 1900, eventURL: ""), EventModel(event: "First radio program broadcast", eventYear: 1906, eventURL: ""), EventModel(event: "World War I begins", eventYear: 1914, eventURL: ""), EventModel(event: "First self serve grocerie store", eventYear: 1916, eventURL: ""), EventModel(event: "Creation of NHL", eventYear: 1917, eventURL: ""), EventModel(event: "World War I Ends", eventYear: 1918, eventURL: ""), EventModel(event: "Walt Disney Company formed", eventYear: 1922, eventURL: ""), EventModel(event: "Founding of Time Magazine", eventYear: 1923, eventURL: ""), EventModel(event: "First Winter Olympics", eventYear: 1924, eventURL: ""), EventModel(event: "Mussolini becomes dictator of Italy", eventYear: 1925, eventURL: ""), EventModel(event: "Stalin becomes leader of the Soviet Union", eventYear: 1927, eventURL: ""), EventModel(event: "Discovery of penicilin", eventYear: 1928, eventURL: ""), EventModel(event: "Crash of Wall St.", eventYear: 1929, eventURL: ""), EventModel(event: "The Twinkie is invented", eventYear: 1930, eventURL: ""), EventModel(event: "Empire state building constructed", eventYear: 1931, eventURL: ""), EventModel(event: "First appearance of Superman in action comic", eventYear: 1932, eventURL: ""), EventModel(event: "Adolf Hitler becomes the chancellor of Germany", eventYear: 1933, eventURL: ""), EventModel(event: "First laundromat opens in Texas", eventYear: 1934, eventURL: ""), EventModel(event: "Completion of the Hoover Dam", eventYear: 1936, eventURL: ""), EventModel(event: "Marijuana Tax Act initiated in the United States", eventYear: 1937, eventURL: ""), EventModel(event: "First commercial use of Nylon", eventYear: 1938, eventURL: ""), EventModel(event: "The Wizard of Oz is released", eventYear: 1939, eventURL: ""), EventModel(event: "The foundinf of IKEA", eventYear: 1943, eventURL: ""), EventModel(event: "First global financial system", eventYear: 1944, eventURL: ""), EventModel(event: "World War II ends", eventYear: 1945, eventURL: ""), EventModel(event: "World Wide Web invented", eventYear: 1990, eventURL: ""), EventModel(event: "Jurassic Park is released", eventYear: 1993, eventURL: ""), EventModel(event: "Launch of Amazon.com", eventYear: 1994, eventURL: ""), EventModel(event: "World Trade Organization created", eventYear: 1995, eventURL: ""), EventModel(event: "The Lion King is released", eventYear: 1996, eventURL: ""), EventModel(event: "Harry Potter and the Philosophers Stone", eventYear: 1997, eventURL: ""), EventModel(event: "The first broadcast of Sex and the City", eventYear: 1998, eventURL: ""), EventModel(event: "World population reaches 6 billion", eventYear: 1999, eventURL: ""), EventModel(event: "The Sims game is released", eventYear: 2000, eventURL: ""), EventModel(event: "The iPod and iTunes are released", eventYear: 2001, eventURL: ""), EventModel(event: "War against Iraq begins", eventYear: 2003, eventURL: ""), EventModel(event: "Google buys YouTube", eventYear: 2006, eventURL: ""), EventModel(event: "the iPad is released", eventYear: 2010, eventURL: ""), EventModel(event: "End of the encyclopedia Brittanica", eventYear: 2012, eventURL: "")]
    
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












































