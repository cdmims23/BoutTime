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
    let events: [EventModel] = [EventModel(event: "First breakfast cereal invented", eventYear: 1863), EventModel(event: "Kodak debuts the first dollar box camera", eventYear: 1900), EventModel(event: "First radio program broadcast", eventYear: 1906), EventModel(event: "World War I begins", eventYear: 1914), EventModel(event: "First self serve grocerie store", eventYear: 1916), EventModel(event: "Creation of NHL", eventYear: 1917), EventModel(event: "World War I Ends", eventYear: 1918), EventModel(event: "Walt Disney Company formed", eventYear: 1922), EventModel(event: "Founding of Time Magazine", eventYear: 1923), EventModel(event: "First Winter Olympics", eventYear: 1924), EventModel(event: "Mussolini becomes dictator of Italy", eventYear: 1925), EventModel(event: "Stalin becomes leader of the Soviet Union", eventYear: 1927), EventModel(event: "Discovery of penicilin", eventYear: 1928), EventModel(event: "Crash of Wall St.", eventYear: 1929), EventModel(event: "The Twinkie is invented", eventYear: 1930), EventModel(event: "Empire state building constructed", eventYear: 1931), EventModel(event: "First appearance of Superman in action comic", eventYear: 1932), EventModel(event: "Adolf Hitler becomes German Chancellor", eventYear: 1933), EventModel(event: "First laundromat opens in Texas", eventYear: 1934), EventModel(event: "Completion of Hoover Dam", eventYear: 1936), EventModel(event: "Marijuana Tax Act initiated in the United States", eventYear: 1937), EventModel(event: "First commercial use of Nylon", eventYear: 1938), EventModel(event: "The Wizard of Oz released", eventYear: 1939), EventModel(event: "The founding of IKEA", eventYear: 1943), EventModel(event: "First global financial system", eventYear: 1944), EventModel(event: "World War II ends", eventYear: 1945), EventModel(event: "World Wide Web invented", eventYear: 1990), EventModel(event: "Jurassic Park released", eventYear: 1993), EventModel(event: "Launch of Amazon.com", eventYear: 1994), EventModel(event: "World Trade organization created", eventYear: 1995), EventModel(event: "The Lion King is released", eventYear: 1996), EventModel(event: "Harry Potter and the Philosophers Stone", eventYear: 1997), EventModel(event: "The first broadcast of Sex and the City", eventYear: 1998), EventModel(event: "World population reaches 6 billion", eventYear: 1999), EventModel(event: "The Sims game is released", eventYear: 2000), EventModel(event: "iPod and iTunes released", eventYear: 2001), EventModel(event: "War against Iraq begins", eventYear: 2003), EventModel(event: "Google buys YouTube", eventYear: 2006),EventModel(event: "iPad released", eventYear: 2010), EventModel(event: "Vancouver Canucks Stanley Cup Riot", eventYear: 2011), EventModel(event: "End of the Encyclopedia Brittanica", eventYear: 2012)]
    
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
    
    func removeEvents() {
        numbers.removeAll()
    }
    
    
}












































