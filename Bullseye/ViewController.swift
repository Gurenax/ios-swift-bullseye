//
//  ViewController.swift
//  Bullseye
//
//  Created by Glenn Dimaliwat on 12/3/18.
//  Copyright © 2018 Gurenax. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactSwitch: UISwitch!
    
    
    var counter = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move this slider to \(randomNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkValue(_ sender: Any) {
        let numSliderValue = Int(numSlider.value)
        var didWin = false
        if exactSwitch.isOn {
            didWin = evaluateWinByExact(numValue: numSliderValue)
        } else {
            didWin = evaluateWinByNotExact(numValue: numSliderValue)
        }
        displayResult(playerWon: didWin)
    }
    
    func evaluateWinByExact(numValue: Int) -> Bool {
        return randomNumber == Int(numValue)
    }
    
    func evaluateWinByNotExact(numValue: Int) -> Bool {
        return (Int(numSlider.value) > randomNumber - 3 && Int(numSlider.value) < randomNumber + 3)
    }
    
    func displayResult(playerWon: Bool) {
        if(playerWon) {
            resultLabel.text = "You were on point! Bullseye!"
        } else {
            resultLabel.text = "Whoops! You missed! Try again later!"
        }
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
//        numLabel.text = "\(round(numSlider.value))"
    }
}

