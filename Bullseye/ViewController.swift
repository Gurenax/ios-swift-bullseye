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
    @IBOutlet weak var playAgainButton: UIButton!
    
    
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

    // Press check button
    @IBAction func checkValue(_ sender: Any) {
        var didWin = false
        if exactSwitch.isOn {
            didWin = evaluateWinByExact(numValue: Int(numSlider.value))
        } else {
            didWin = evaluateWinByNotExact(numValue: Int(numSlider.value))
        }
        displayResult(playerWon: didWin)
    }
    
    // Check if player wins with exact mode On
    func evaluateWinByExact(numValue: Int) -> Bool {
        return randomNumber == Int(numValue)
    }
    
    func evaluateWinByNotExact(numValue: Int) -> Bool {
        return (Int(numSlider.value) > randomNumber - 3 && Int(numSlider.value) < randomNumber + 3)
    }
    
    // Check if player wins with exact mode Off
    func displayResult(playerWon: Bool) {
        if(playerWon) {
            resultLabel.text = "You were on point! Bullseye!"
            resultLabel.backgroundColor = UIColor.green
            resultLabel.textColor = UIColor.black
        } else {
            resultLabel.text = "Whoops! You missed! Try again later!"
            resultLabel.backgroundColor = UIColor.red
            resultLabel.textColor = UIColor.white
        }
        // Show result label and play again button
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }

    // Play again: reset values
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move this slider to \(randomNumber)"
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        numLabel.text = "\(round(numSlider.value))"
    }
}

