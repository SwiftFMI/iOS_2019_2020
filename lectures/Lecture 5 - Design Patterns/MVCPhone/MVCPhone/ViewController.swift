//
//  ViewController.swift
//  MVCPhone
//
//  Created by Dragomir Ivanov on 30.10.19.
//  Copyright © 2019 Swift FMI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet var numButtons: [UIButton]!
    
    @IBAction func numButtonTapped(_ sender: UIButton) {
        // append currentTitle to the model
    }
    
    @IBAction func callButtonTapped(_ sender: UIButton) {
        // print calling X
    }
    
    @IBAction func eraseButtonTapped(_ sender: UIButton) {
        // model drop last character
    }
    
    @IBAction func zeroLongPressed(_ sender: UILongPressGestureRecognizer) {
        // replace "0" with "+"
    }
}

