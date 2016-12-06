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
        game.getEvent(firstLabel: firstLabel, secondLabel: secondLabel, thirdLabel: thirdLabel, fourthLabel: fourthLabel)
    }

    @IBAction func switchButton(_ sender: Any) {
    }

}

