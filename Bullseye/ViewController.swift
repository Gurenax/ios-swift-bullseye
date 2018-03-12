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
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func increase(_ sender: Any) {
        counter += 1
        numLabel.text = "\(counter)"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        numLabel.text = "\(round(numSlider.value))"
    }
}

