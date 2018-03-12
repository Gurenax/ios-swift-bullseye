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
        if randomNumber == Int(numSlider.value) {
            resultLabel.text = "You were on point! Bullseye!"
        } else {
            resultLabel.text = "Whoops! You missed! Try again later!"
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        numLabel.text = "\(round(numSlider.value))"
    }
}

