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
    
    let game = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEvents()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayEvents() {
        firstLabel.text = game.getEvent().event
        secondLabel.text = game.getEvent().event
        thirdLabel.text = game.getEvent().event
        fourthLabel.text = game.getEvent().event
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

}

